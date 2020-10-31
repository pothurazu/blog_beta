@extends('layouts.app')

@section('content')
    <div class="container">

        @include('frontend._search')
        
        <div class="row">

        <div class="col-md-8">
                @forelse ($posts as $post)
               
                    <div class="panel panel-default" style="padding-left:50px">
                       <div class="panel-heading">
                           <b> {{ $post->title }}</b> - <small>by {{ $post->user->name }}</small>

                            <span class="pull-right">
                                {{ $post->created_at->toDayDateTimeString() }}
                            </span>
                        </div>
                 
                 @if($post->post_type == 'image') 
                        <div class="panel-heading" >

                        <img style=" border-radius:8px;height:480px;width:650px;" class="img-responsive" src="/post_img/{{ $post->image }}" >

                        </div>
                        <p>{{ str_limit($post->body, 200) }}</p>
                 @elseif($post->post_type == 'video')
                 <div class="panel-heading"style="position: relative;padding-bottom: 50%;">
                  <iframe  style="position: absolute;top: 0;left:0;width: 93%;height: 100%;"  src=" {{ $post->video_url }} " type="text/html" width="480" height="295" frameborder="0" allowfullscreen></iframe>
                 </div>
                 <p>{{ str_limit($post->body, 200) }}</p>
                 @else($post->post_type == 'content')
                 <p>{{ $post->body}}</p>
                @endif

            <div class="panel-body"  data-postid="{{ $post->id }}">
                <!-- Cont -->
                
                <p>
                    Tags:
                    @forelse ($post->tags as $tag)
                        <span class="label label-default">{{ $tag->name }}</span>
                    @empty
                        <span class="label label-danger">No tag found.</span>
                    @endforelse
                </p>
                <p>
                    <a href="{{ url("/posts/{$post->id}") }}" style="color:black">See more</a>                
                </p>
                @if(Auth::user())
                
                    <div >
                      
                        <a  href="#" class="like">{!! Auth::user()->likes()->where('post_id', $post->id)->first() ? Auth::user()->likes()->where('post_id', $post->id)->first()->like == 1 ? 'You like this post' : 'Like' : 'Like'  !!}</a> 
                        <a style = "padding-left: 10px;" href="#" class="like">{{ Auth::user()->likes()->where('post_id', $post->id)->first() ? Auth::user()->likes()->where('post_id', $post->id)->first()->like == 0 ? 'You don\'t like this post' : 'Dislike' : 'Dislike'  }}</a>
                        <a style = "padding-left: 10px;" href="{{ url("/posts/{$post->id}") }}" class="fa fa-comments">{{ $post->comments_count }}</a>
                    </div>
                 @endif
                 </div>
            </div>
            
                
                @empty
                    <div class="panel panel-default">
                        <div class="panel-heading">Not Found!!</div>

                        <div class="panel-body">
                            <p>Sorry! No post found.</p>
                        </div>
                    </div>
                @endforelse

                <div align="center">
                    {!! $posts->appends(['search' => request()->get('search')])->links() !!}
                </div>

            </div>


            <!-- side bar side bar side bar side bar side bar side bar side bar side bar  -->
            <div class="container">
           
                <div class="row">
                   <div class="col-md-4 panel panel-default">
                   @forelse ($results as $result)
                       <a href="{{ url("/posts/{$result->id}") }}"> 
                        <div class="panel-heading" >
                           <h4 style="color:black;font-weight: 900;"> {{ $result->title }}</h4>
                            <small style="color:black;" class="pull-right">- {{ $result->user->name }}</small>

                                <div class='row'>
                                @if(isset($result->image))
                                    <div class="col-md-5 ">
                                        <img   width="150" height="75" src="/post_img/{{ $result->image }}" >
                                    </div>
                                @endisset  
                                
                                
                                @if(isset($result->video_url))
                                    <div style="position: relative;padding-bottom: 20%;" class="col-md-5 ">
    
                                         <iframe style="position: absolute;top: 0;left:5;width: 100%;height: 100%;"  src=" {{ $result->video_url }} " width="150" height="95" frameborder="0" scrolling="no"></iframe>
                                    </div>      
                                @endisset
                                </div>
                               
                                <p style="color:black;" class="pull-right">{{ str_limit($result->body, 100) }}</p>
                            </div>
                        </a>
                         
                        @empty
                    <div class="panel panel-default">
                        <div class="panel-heading">Not Found!!</div>

                        <div class="panel-body">
                            <p>Sorry! No post found.</p>
                        </div>
                    </div>
                @endforelse
                    </div>
                </div> 
            </div>

        </div>
    </div>
@endsection
