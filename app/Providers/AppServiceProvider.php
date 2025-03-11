<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Http\Middleware\RoleMiddleware;
use Laravel\Sanctum\Sanctum;
use Illuminate\Pagination\Paginator;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        $this->app->router->aliasMiddleware('role', RoleMiddleware::class);
        Sanctum::usePersonalAccessTokenModel(\App\Models\PersonalAccessToken::class);
        Paginator::useBootstrapFive();
    }
}
