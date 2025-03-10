<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Validation\ValidationException;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;

class ProductController extends BaseController
{
    public function __construct()
    {
        $this->middleware('auth:sanctum'); // Ensure token authentication
        // $this->middleware('role:admin')->only(['store', 'update', 'destroy']); // Uncomment if role-based access is needed
    }

    /**
     * List all products for the authenticated user.
     */
    public function index()
    {
        try {
            $user = Auth::user();

            if (!$user) {
                return response()->json(['message' => 'Unauthorized'], 401);
            }

            $products = Product::where('user_id', $user->id)->get();

            return response()->json([
                'message' => 'Products retrieved successfully',
                'products' => $products
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Failed to retrieve products',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Show a single product with a QR code URL.
     */
    public function show($id)
    {
        $product = Product::find($id);

        if (!$product) {
            return response()->json(['message' => 'Product not found'], 404);
        }

        // Generate unique product identifier
        $random_product_id = 'PRD-' . $product->id . '-' . Str::random(8);

        // Ensure QR code exists
        if (!$product->qr_code) {
            $qrCodePath = 'qr_codes/product-' . $product->id . '.png';
            QrCode::format('png')->size(200)->generate($random_product_id, storage_path('app/public/' . $qrCodePath));
            $product->qr_code = $qrCodePath;
            $product->save();
        }

        return response()->json([
            'product' => $product,
            'random_product_id' => $random_product_id,
            'qr_code_url' => asset('storage/' . $product->qr_code)
        ], 200);
    }

    /**
     * Store a new product.
     */
    public function store(Request $request)
    {
        try {
            $validatedData = $request->validate([
                'part_name' => 'required|string',
                'part_number' => 'required|string|unique:products,part_number',
                'total_qty' => 'required|integer|min:1',
                'location' => 'nullable|string',
                'serialized_status' => 'nullable|in:true,false,1,0,yes,no,enable,disable', // Accepts more variations
                'serial_number' => 'nullable|unique:products,serial_number',
            ]);

            // Convert serialized_status into boolean
            $validatedData['serialized_status'] = filter_var($validatedData['serialized_status'], FILTER_VALIDATE_BOOLEAN, FILTER_NULL_ON_FAILURE);

            $product = Product::create([
                'part_number' => $validatedData['part_number'],
                'total_qty' => $validatedData['total_qty'],
                'location' => $validatedData['location'],
                'part_name' => $validatedData['part_name'],
                'serialized_status' => $validatedData['serialized_status'],
                'serial_number' => $validatedData['serial_number'],
                'user_id' => $request->user()->id,
            ]);

            return response()->json([
                'message' => 'Product successfully added',
                'product' => $product,
            ], 201);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Something went wrong', 'error' => $e->getMessage()], 500);
        }
    }

    /**
     * Update an existing product.
     */
    public function update(Request $request, Product $product)
    {
        try {
            // Ensure the authenticated user owns the product
            if ($request->user()->id !== $product->user_id) {
                return response()->json(['message' => 'Unauthorized'], 403);
            }

            // Validate request
            $validatedData = $request->validate([
                'part_name' => 'required|string',
                'part_number' => 'required|string|unique:products,part_number,' . $product->id,
                'total_qty' => 'required|integer|min:1',
                'location' => 'nullable|string',
                'serialized_status' => 'nullable|in:true,false,1,0,yes,no,enable,disable', // Accepts different boolean formats
                'serial_number' => 'nullable|unique:products,serial_number,' . $product->id,
            ]);

            // Convert serialized_status into a boolean
            if (isset($validatedData['serialized_status'])) {
                $validatedData['serialized_status'] = filter_var($validatedData['serialized_status'], FILTER_VALIDATE_BOOLEAN, FILTER_NULL_ON_FAILURE);
            }

            // Update the product
            $product->update($validatedData);

            return response()->json([
                'message' => 'Product updated successfully',
                'product' => $product
            ], 200);

        } catch (ValidationException $e) {
            return response()->json(['message' => 'Validation failed', 'errors' => $e->errors()], 422);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Something went wrong', 'error' => $e->getMessage()], 500);
        }
    }


    /**
     * Delete a product (soft delete).
     */
    public function destroy(Request $request, Product $product)
    {
        try {
            if (!$product) {
                return response()->json(['message' => 'Product not found'], 404);
            }

            if ($request->user()->id !== $product->user_id) {
                return response()->json(['message' => 'Unauthorized'], 403);
            }

            // Perform a soft delete
            $product->delete();

            return response()->json(['message' => 'Product deleted successfully'], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Something went wrong', 'error' => $e->getMessage()], 500);
        }
    }
}
