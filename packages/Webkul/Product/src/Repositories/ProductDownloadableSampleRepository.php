<?php

namespace Webkul\Product\Repositories;

use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Webkul\Core\Eloquent\Repository;

class ProductDownloadableSampleRepository extends Repository
{
    /**
     * Specify Model class name
     */
    public function model(): string
    {
        return 'Webkul\Product\Contracts\ProductDownloadableSample';
    }

    /**
     * @param  array  $data
     * @param  int  $productId
     * @return mixed
     */
    public function upload($data, $productId)
{
    // Verificar si el archivo fue subido
    if (! request()->hasFile('file')) {
        return [];
    }

    // Subir el archivo al disco S3 en la carpeta 'product_downloadable_links/{productId}'
    $path = request()->file('file')->store('product_downloadable_links/'.$productId, 's3');

    // Obtener el nombre original del archivo
    $fileName = request()->file('file')->getClientOriginalName();

    // Generar la URL del archivo en S3
    $fileUrl = Storage::disk('s3')->url($path);

    return [
        'file'      => $path,
        'file_name' => $fileName,
        'file_url'  => $fileUrl,
    ];
}


    /**
     * @param  Webkul\Product\Contracts\Product  $product
     * @return void
     */
    public function saveSamples(array $data, $product)
    {
        $previousSampleIds = $product->downloadable_samples()->pluck('id');

        if (isset($data['downloadable_samples'])) {
            foreach ($data['downloadable_samples'] as $sampleId => $data) {
                if (Str::contains($sampleId, 'sample_')) {
                    $this->create(array_merge([
                        'product_id' => $product->id,
                    ], $data));
                } else {
                    if (is_numeric($index = $previousSampleIds->search($sampleId))) {
                        $previousSampleIds->forget($index);
                    }

                    $this->update($data, $sampleId);
                }
            }
        }

        foreach ($previousSampleIds as $sampleId) {
            $this->delete($sampleId);
        }
    }
}
