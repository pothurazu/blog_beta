<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Comment;
use Illuminate\Http\Request;
use App\Like;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class BlogController extends Controller
{
    public function index(Request $request)
    {
        $posts = Post::when($request->search, function ($query) use ($request) {
            $search = $request->search;

            return $query->where('title', 'like', "%$search%")
                ->orWhere('body', 'like', "%$search%");
        })->with('tags', 'category', 'user')
            ->withCount('comments')
            ->published()
            ->orderBy('id', 'desc')
            ->simplePaginate(100000000000000);
        $results = Post::where('is_published', '=', '1')->get();

        return view('frontend.index', compact('posts', 'results'));
    }

    public function post(Post $post)
    {
        $post = $post->load(['comments.user', 'tags', 'user', 'category']);
        $results = Post::inRandomOrder()->get();
        return view('frontend.post', compact('post', 'results'));
    }

    public function comment(Request $request, Post $post)
    {
        $this->validate($request, ['body' => 'required']);

        $post->comments()->create([
            'body' => $request->body,
        ]);

        flash()->overlay('Comment successfully created');

        return redirect("/posts/{$post->id}");
    }
    public function postLikePost(Request $request)
    {

        

        $post_id = $request['postId'];
        $is_like = $request['isLike'] === 'true';
        $update = false;
        $post = Post::find($post_id);

        if (!$post) {
            return null;
        }
        $user = Auth::user();
        $like = $user->likes()->where('post_id', $post_id)->first();
        //    $like = $user->Like::likes()->where('post_id', $post_id)->first();

        if ($like) {
            $already_like = $like->like;
            $update = true;
            if ($already_like == $is_like) {
                $like->delete();
                return null;
            }
        } else {
            $like = new Like();
        }
        $like->like = $is_like;
        $like->user_id = $user->id;
        $like->post_id = $post->id;
        if ($update) {
            $like->update();
        } else {
            $like->save();
        }

        return null;
    }


}
