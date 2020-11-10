<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Stripe, Mailgun, SparkPost and others. This file provides a sane
    | default location for this type of information, allowing packages
    | to have a conventional place to find your various credentials.
    |
    */

    'mailgun' => [
        'domain' => env('MAILGUN_DOMAIN'),
        'secret' => env('MAILGUN_SECRET'),
    ],

    'ses' => [
        'key' => env('SES_KEY'),
        'secret' => env('SES_SECRET'),
        'region' => 'us-east-1',
    ],

    'sparkpost' => [
        'secret' => env('SPARKPOST_SECRET'),
    ],

    'stripe' => [
        'model' => App\User::class,
        'key' => env('STRIPE_KEY'),
        'secret' => env('STRIPE_SECRET'),
    ],
    'facebook' => [
        'client_id'     => '3351403098305813',
        'client_secret' => '9115408605d4630207a5fee84aa7fd72',
        'redirect'      => 'http://ec2-3-16-89-88.us-east-2.compute.amazonaws.com/login/facebook/callback',
        
    ],
    'google' => [
        'client_id' => '592142350220-s5iv2je3faav54st5qmu2cf0iuj68c0r.apps.googleusercontent.com',
        'client_secret' => '9jeR9uZ_OsYe9S-eyrKqDuOw',
        'redirect' => 'http://ec2-3-16-89-88.us-east-2.compute.amazonaws.com/login/google/callback',
    ],

];
