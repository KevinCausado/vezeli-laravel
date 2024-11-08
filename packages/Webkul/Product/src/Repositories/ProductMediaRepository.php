<?php

namespace Webkul\Product\Repositories;

use Exception;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Intervention\Image\ImageManager;
use Webkul\Core\Eloquent\Repository;

class ProductMediaRepository extends Repository
{
    /**
     * Specify model class name.
     *
     * @return string
     */
    public function model()
    {
        /**
         * This repository is extended to `ProductImageRepository` and `ProductVideoRepository`
         * repository.
         *
         * And currently no model is assigned to this repo.
         */
    }

    /**
     * Get product directory.
     *
     * @param  \Webkul\Product\Contracts\Product  $product
     */
    public function getProductDirectory($product): string
    {
        return 'product/'.$product->id;
    }

    /**
     * Upload.
     *
     * @param  array  $data
     * @param  \Webkul\Product\Contracts\Product  $product
     */
    public function upload($data, $product, string $uploadFileType): void
    {
        /**
         * Previous model ids for filtering.
         */
        $previousIds = $this->resolveFileTypeQueryBuilder($product, $uploadFileType)->pluck('id');

        $position = 0;

        if (! empty($data[$uploadFileType]['files'])) {
            foreach ($data[$uploadFileType]['files'] as $indexOrModelId => $file) {
                if ($file instanceof UploadedFile) {
                    if (Str::contains($file->getMimeType(), 'image')) {
                        $manager = new ImageManager;

                        $image = $manager->make($file)->encode('webp');

                        // Store the image on S3 disk with a random name
                        $path = $this->getProductDirectory($product).'/'.Str::random(40).'.webp';

                        // Store in S3
                        Storage::disk('s3')->put($path, $image);

                        // Get the URL for the image stored on S3
                        $fileUrl = Storage::disk('s3')->url($path);
                    } else {
                        // Store non-image files on S3
                        $path = $file->store($this->getProductDirectory($product), 's3');
                        $fileUrl = Storage::disk('s3')->url($path);
                    }

                    // Store media info in database
                    $this->create([
                        'type'       => $uploadFileType,
                        'path'       => $path,
                        'product_id' => $product->id,
                        'position'   => ++$position,
                        'file_url'   => $fileUrl, // Save URL to the database if needed
                    ]);
                } else {
                    if (is_numeric($index = $previousIds->search($indexOrModelId))) {
                        $previousIds->forget($index);
                    }

                    // Update position if the file already exists
                    $this->update([
                        'position' => ++$position,
                    ], $indexOrModelId);
                }
            }
        }

        // Clean up and delete old media files
        foreach ($previousIds as $indexOrModelId) {
            if (! $model = $this->find($indexOrModelId)) {
                continue;
            }

            // Delete file from S3
            Storage::disk('s3')->delete($model->path);

            // Delete the record from the database
            $this->delete($indexOrModelId);
        }
    }

    /**
     * Resolve file type query builder.
     *
     * @param  \Webkul\Product\Contracts\Product  $product
     * @return mixed
     *
     * @throws \Exception
     */
    private function resolveFileTypeQueryBuilder($product, string $uploadFileType)
    {
        if ($uploadFileType === 'images') {
            return $product->images();
        } elseif ($uploadFileType === 'videos') {
            return $product->videos();
        }

        throw new Exception('Unsupported file type.');
    }
}
