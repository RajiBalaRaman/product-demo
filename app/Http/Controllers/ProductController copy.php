<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController; // Ensure this is imported
use Illuminate\Validation\ValidationException;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;

class ProductController extends BaseController
{
    public function __construct()
    {
        $this->middleware('auth:sanctum');
        // $this->middleware('role:admin')->only(['store', 'update', 'destroy']);
    }

    public function index()
    {
        try {
            $products = Product::all();
            return response()->json(['message' => 'Products retrieved successfully', 'products' => $products]);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Failed to retrieve products', 'error' => $e->getMessage()], 500);
        }
    }

    public function show($id)
    {
        $product = Product::find($id);

        if (!$product) {
            return response()->json(['message' => 'Product not found'], 404);
        }

        // Generate a random product identifier using UUID or random string
        $random_product_id = 'PRD-' . $product->id . '-' . Str::random(8);

        return response()->json([
            'product' => $product,
            'random_product_id' => $random_product_id, // Random text-based product ID
            'qr_code_url' => $product->qr_code ? asset('storage/' . $product->qr_code) : null
        ]);
    }

    public function store(Request $request)
{
    try {
        $request->validate([
            'name' => 'required',
            'price' => 'required|numeric',
        ]);

        $product = Product::create([
            'name' => $request->name,
            'description' => $request->description,
            'price' => $request->price,
            'user_id' => $request->user()->id,
        ]);

        // Ensure public/qr_codes directory exists
        $qrCodePath = public_path('qr_codes');
        if (!File::exists($qrCodePath)) {
            File::makeDirectory($qrCodePath, 0755, true, true);
        }

        // Generate QR Code and save in public/qr_codes
        $qrCodeFile = 'qr_codes/product_' . $product->id . '.png';
        QrCode::format('png')->size(200)->generate($product->id, public_path($qrCodeFile));

        // Update product with QR Code path
        $product->update(['qr_code' => $qrCodeFile]);

        return response()->json([
            'message' => 'Product successfully added',
            'product' => $product,
            'qr_code_url' => asset($qrCodeFile) // Return URL for frontend
        ], 201);
    } catch (\Exception $e) {
        return response()->json(['message' => 'Something went wrong', 'error' => $e->getMessage()], 500);
    }
}


    public function update(Request $request, Product $product)
    {
        try {
            if ($request->user()->id !== $product->user_id) {
                return response()->json(['message' => 'Unauthorized'], 403);
            }

            $request->validate([
                'name' => 'required',
                'price' => 'required|numeric',
            ], [
                'name.required' => 'The name field is required.',
                'price.required' => 'The price field is required.',
                'price.numeric' => 'The price must be a number.',
            ]);

            $product->update($request->all());
            return response()->json(['message' => 'Product updated successfully', 'product' => $product]);
        } catch (ValidationException $e) {
            return response()->json(['message' => 'Validation failed', 'errors' => $e->errors()], 422);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Invalid token'], 401);
        }
    }

    public function destroy(Request $request, Product $product)
    {

        try {
            // Check if the product exists
            if (!$product) {
                return response()->json(['message' => 'Product not found'], 404);
            }

            // Ensure the authenticated user is the owner of the product
            if ($request->user()->id !== $product->user_id) {
                return response()->json(['message' => 'Unauthorized'], 403);
            }

            // Perform a hard delete
            $product->forceDelete();

            return response()->json(['message' => 'Product deleted successfully']);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Something went wrong', 'error' => $e->getMessage()], 500);
        }
    }


}
