
@forelse ($post->comments->reverse() as $comment)
 



    <div class="panel panel-default">
        <div class="panel-heading">
            {{ $comment->user->name }} says...
           
            <span class="pull-right">{{ $comment->created_at->diffForHumans() }}
               
            @if(isset($$comment->user_id))
                @if($comment->user_id == Auth::user()->id)
                
                
                <a class="fa fa-trash"  href="{{ url("/admin/comments/{$comment->id}") }}" data-method="DELETE" data-token="{{ csrf_token() }}" data-confirm="Are you sure to delete ur comment?" ></a>                    
                @endif
              @endif
                
            </span>
           
        </div>

        <div class="panel-body">
            <p>{{ $comment->body }}</p>
        </div>
        
        
    </div>
@empty
    <div class="panel panel-default">
        <div class="panel-heading">Not Found!!</div>

        <div class="panel-body">
            <p>Sorry! No comment found for this post.</p>
        </div>
    </div>
@endforelse

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

