<?php

namespace App;

use App\Models\Comment;
use App\Models\Post;
use App\Like;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
// use Cog\Contracts\Love\Reacterable\Models\Reacterable as LikerContract;
// use Cog\Laravel\Love\Reacterable\Models\Traits\Reacterable;

use Cog\Contracts\Love\Reacterable\Models\Reacterable as ReacterableInterface;
use Cog\Laravel\Love\Reacterable\Models\Traits\Reacterable;

 
class User extends Authenticatable   implements ReacterableInterface
{
    use Notifiable , Reacterable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',

    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($user) {
            if (empty($user->api_token)) {
                $user->api_token = str_random(50);
            }
        });

        static::deleting(function ($user) {
            $user->posts()->delete();
            $user->comments()->delete();
        });
    }

    public function posts()
    {
        return $this->hasMany(Post::class);
    }

    public function likes()
    {
        return $this->hasMany(Like::class);
    }
    // public function post()
    // {
    //     return $this->hasMany(Post::class);
    // }
    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    public function scopeAdmin($query)
    {
        return $query->where('is_admin', true);
    }
}
