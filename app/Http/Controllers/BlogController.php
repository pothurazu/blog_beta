<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Comment;
use Illuminate\Http\Request;
use App\Like;
use App\Models\Category;
use DB;
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
            // ->orWhere('comment','like',"%$search%");
        })->with('tags', 'category', 'user')
            ->withCount('comments')
            ->published()
            ->orderBy('id', 'desc')
            ->simplePaginate(100000000000000);
        $results = Post::where('is_published', '=', '1')->get();
        $cat = Category::orderBy('id')->get();
        // var_dump($categories);die;
        return view('frontend.index', compact('posts', 'results', 'cat'));
    }

    public function post(Post $post)
    {

        $post = $post->load(['comments.user', 'tags', 'user', 'category']);
        $results = Post::inRandomOrder()->get();
        // $lyk = DB::table('love_reactions')
        // ->join('posts', 'love_reactions.reactant_id', '=', 'posts.love_reactant_id')->where('posts.id', $post->id)
        // ->get();
        // $count = $lyk->count();



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



    public function category_filter(Request $request)
    {

        $posts = Post::when($request->search, function ($query) use ($request) {
            $search = $request->search;

            return $query->where('title', 'like', "%$search%")
                ->orWhere('body', 'like', "%$search%");
        })->with('tags', 'category', 'user')
            ->where('category_id', '=', $request->id)
            ->withCount('comments')
            ->published()
            ->orderBy('id', 'desc')
            ->simplePaginate(100000000000000);
        // $results = Post::where('is_published', '=', '1')->get();
        $cat = Category::orderBy('id')->get();
        

        return view('frontend.cat_filter', compact('posts', 'cat'));
    }
}
