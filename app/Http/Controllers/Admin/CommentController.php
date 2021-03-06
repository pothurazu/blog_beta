<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class CommentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $comments = Comment::with('post')->paginate(10);

        return view('admin.comments.index', compact('comments'));
    }

    public function edit(Comment $comment)
    {
        return view('frontend._form', compact('comment'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Comment $comment)
    {    
      
        if($comment->user_id == Auth::user()->id){
            
            $comment->delete();
            flash()->overlay('Comment deleted successfully.');
    
            return redirect('/posts/'.$comment->post_id );
        }
        else{
            if ($comment->user_id != auth()->user()->id && auth()->user()->is_admin == false) {
                flash()->overlay("You can't delete other peoples comment.");
    
                return redirect('/posts/'.$comment->post_id );
        
            }
    
            $comment->delete();
            flash()->overlay('Comment deleted successfully.');
    
            return redirect('/admin/comments');
         }
       
    }
}
