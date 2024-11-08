<?php

namespace Webkul\Product;

use Illuminate\Support\Facades\Storage;
use League\Flysystem\Local\LocalFilesystemAdapter;
use Webkul\Customer\Contracts\Wishlist;
use Webkul\Product\Repositories\ProductRepository;

class ProductImage
{
    /**
     * Create a new helper instance.
     *
     * @return void
     */
    public function __construct(protected ProductRepository $productRepository) {}

    /**
     * Retrieve collection of gallery images.
     *
     * @param  \Webkul\Product\Contracts\Product  $product
     * @return array
     */
    public function getGalleryImages($product)
{
    if (! $product) {
        return [];
    }

    $images = [];

    // Iterar a través de las imágenes asociadas al producto
    foreach ($product->images as $image) {
        // Verificar si la imagen existe en el bucket S3
        if (! Storage::disk('s3')->exists($image->path)) {
            continue;
        }

        // Obtener la URL pública de la imagen almacenada en S3
        $images[] = Storage::disk('s3')->url($image->path);
    }

    // Si no se encuentran imágenes, agregar imagen de reemplazo (fallback)
    if (
        ! $product->parent_id
        && ! count($images)
        && ! count($product->videos ?? [])
    ) {
        $images[] = $this->getFallbackImageUrls();
    }

    /*
     * Si el producto no tiene imágenes, intentar buscar las imágenes del producto principal (si existe)
     */
    if (empty($images)) {
        $images = $this->getGalleryImages($product->parent);
    }

    return $images;
}


    /**
     * Get product variant image if available otherwise product base image.
     *
     * @param  \Webkul\Customer\Contracts\Wishlist  $item
     * @return array
     */
    public function getProductImage($item)
{
    // Verifica si el artículo es un Wishlist
    if ($item instanceof Wishlist) {
        // Si tiene una opción configurable seleccionada, busca el producto configurado
        if (isset($item->additional['selected_configurable_option'])) {
            $product = $this->productRepository->find($item->additional['selected_configurable_option']);
        } else {
            // Si no, obtiene el producto directamente
            $product = $item->product;
        }
    } else {
        $product = $item->product;
    }

    // Obtiene la imagen base del producto
    return $this->getProductBaseImage($product);
}


    /**
     * This method will first check whether the gallery images are already
     * present or not. If not then it will load from the product.
     *
     * @param  \Webkul\Product\Contracts\Product  $product
     * @param  array
     * @return array
     */
    public function getProductBaseImage($product, ?array $galleryImages = null)
    {
        // Si hay imágenes de galería, devuelve la primera
        if ($galleryImages) {
            return $galleryImages[0];
        }
    
        // Si no, obtiene la imagen base del producto
        return $this->otherwiseLoadFromProduct($product);
    }
    

    /**
     * Load product's base image.
     *
     * @param  \Webkul\Product\Contracts\Product  $product
     * @return array
     */
    protected function otherwiseLoadFromProduct($product)
{
    // Obtiene las imágenes del producto
    $images = $product?->images;

    // Si el producto tiene imágenes, devuelve la URL de la primera imagen
    if ($images && $images->count()) {
        return $this->getCachedImageUrls($images[0]->path);
    }

    // Si no hay imágenes, devuelve una URL de fallback
    return $this->getFallbackImageUrls();
}

    /**
     * Get cached urls configured for intervention package.
     *
     * @param  string  $path
     */
    private function getCachedImageUrls($path): array
{
    // Si el almacenamiento es local, devuelve URLs locales
    if (! $this->isDriverS3()) {
        return [
            'small_image_url'    => Storage::url($path),
            'medium_image_url'   => Storage::url($path),
            'large_image_url'    => Storage::url($path),
            'original_image_url' => Storage::url($path),
        ];
    }

    // Si el almacenamiento es S3, devuelve URLs de S3
    return [
        'small_image_url'    => Storage::disk('s3')->url($path),
        'medium_image_url'   => Storage::disk('s3')->url($path),
        'large_image_url'    => Storage::disk('s3')->url($path),
        'original_image_url' => Storage::disk('s3')->url($path),
    ];
}


    /**
     * Get fallback urls.
     */
    private function getFallbackImageUrls(): array
{
    // URLs de fallback desde la configuración
    $smallImageUrl = core()->getConfigData('catalog.products.cache_small_image.url')
                    ? Storage::url(core()->getConfigData('catalog.products.cache_small_image.url'))
                    : bagisto_asset('images/small-product-placeholder.webp', 'shop');

    $mediumImageUrl = core()->getConfigData('catalog.products.cache_medium_image.url')
                    ? Storage::url(core()->getConfigData('catalog.products.cache_medium_image.url'))
                    : bagisto_asset('images/medium-product-placeholder.webp', 'shop');

    $largeImageUrl = core()->getConfigData('catalog.products.cache_large_image.url')
                    ? Storage::url(core()->getConfigData('catalog.products.cache_large_image.url'))
                    : bagisto_asset('images/large-product-placeholder.webp', 'shop');

    // Si estamos en S3, se utilizarían URLs públicas de S3 para imágenes de reemplazo, si las configuraciones no existen
    return [
        'small_image_url'    => $smallImageUrl,
        'medium_image_url'   => $mediumImageUrl,
        'large_image_url'    => $largeImageUrl,
        'original_image_url' => bagisto_asset('images/large-product-placeholder.webp', 'shop'),
    ];
}


    /**
     * Is driver local.
     */
    
     private function isDriverS3(): bool
     {
         return Storage::getAdapter() instanceof \League\Flysystem\AwsS3v3\AwsS3Adapter;
     }    
    
    
    
    //  private function isDriverLocal(): bool
    // {
    //     return Storage::getAdapter() instanceof LocalFilesystemAdapter;
    // }
}
