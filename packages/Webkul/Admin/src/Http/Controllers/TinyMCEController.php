<?php

namespace Webkul\Admin\Http\Controllers;

use Illuminate\Support\Facades\Storage;

class TinyMCEController extends Controller
{
    /**
     * Storage folder path.
     *
     * @var string
     */
    private $storagePath = 'tinymce';

    /**
     * Upload file from tinymce.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function upload()
    {
        $media = $this->storeMedia();

        if (!empty($media)) {
            return response()->json([
                'location' => $media['file_url'],
            ]);
        }

        return response()->json([]);
    }

    /**
     * Store media.
     *
     * @return array
     */
    public function storeMedia()
    {
        if (! request()->hasFile('file')) {
            return [];
        }

        // Store the file in S3 using the 's3' disk
        $path = request()->file('file')->store($this->storagePath, 's3');  // Specify 's3' disk here

        return [
            'file'      => $path,
            'file_name' => request()->file('file')->getClientOriginalName(),
            // Use Storage::disk('s3')->url() to get the URL from S3
            'file_url'  => Storage::disk('s3')->url($path),
        ];
    }
}
