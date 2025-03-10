<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class RoleMiddleware
{
    public function handle(Request $request, Closure $next, $role)
    {
        // dd($request->user()->hasRole($role));
        // Check if user is authenticated
        if (!$request->user()) {
            return response()->json(['message' => 'Unauthorized'], Response::HTTP_UNAUTHORIZED);
        }
        // Check if user has the required role using Spatie's method
        if (!$request->user()->hasRole($role)) {
            return response()->json(['message' => 'Access Denied'], Response::HTTP_FORBIDDEN);
        }

        return $next($request);
    }
}


