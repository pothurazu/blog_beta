<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
use App\Http\Controllers\Auth\LoginController;

Route::get('/', 'BlogController@index');
Route::get('/cat_id/{id}', 'BlogController@category_filter');
// Route::get('/posts/{post}', 'BlogController@post');
Route::get('/posts/{post}', 'Admin\PostController@post');
Route::post('/posts/{post}/comment', 'BlogController@comment')->middleware('auth');

Auth::routes();
Route::get('/profile', 'Auth\\ProfileController@index')->middleware('auth');

// Route::get('/home', 'HomeController@index');
Route::get('/home', 'BlogController@index');
Route::group(['prefix' => 'admin', 'namespace' => 'Admin', 'middleware' => 'auth'], function () {
    Route::resource('/posts', 'PostController');
    Route::put('/posts/{post}/publish', 'PostController@publish')->middleware('admin');
    Route::resource('/categories', 'CategoryController', ['except' => ['show']]);
    Route::resource('/tags', 'TagController', ['except' => ['show']]);
    Route::resource('/comments', 'CommentController', ['only' => ['index', 'destroy']]);
    Route::resource('/comments', 'CommentController');
    Route::resource('/users', 'UserController', ['middleware' => 'admin', 'only' => ['index', 'destroy']]);
    // Route::get('posts/{post}/like', 'PostController@like')->name('posts.like');
    // Route::get('posts/{post}/unlike', 'PostController@unlike')->name('posts.unlike');

    // Route::get('posts/{post}/dislike', 'PostController@dislike')->name('posts.dislike');
    // Route::get('posts/{post}/undislike', 'PostController@undislike')->name('posts.undislike');
});
Route::get('posts/{post}/like', 'Admin\PostController@like')->name('posts.like')->middleware('auth');
Route::get('posts/{post}/unlike', 'Admin\PostController@unlike')->name('posts.unlike')->middleware('auth');

Route::get('posts/{post}/dislike', 'Admin\PostController@dislike')->name('posts.dislike')->middleware('auth');
Route::get('posts/{post}/undislike', 'Admin\PostController@undislike')->name('posts.undislike')->middleware('auth');
// single like and dislike test
Route::post('/like','BlogController@postLikePost')->name('like');

// social logins
Route::get('/login/{social}','Auth\LoginController@socialLogin')->where('social','twitter|facebook|linkedin|google|github|bitbucket');
Route::get('/login/{social}/callback','Auth\LoginController@handleProviderCallback')->where('social','twitter|facebook|linkedin|google|github|bitbucket');