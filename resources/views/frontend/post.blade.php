@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">

            <div class="col-md-8">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        {{ $post->title }} - <small>by {{ $post->user->name }}</small>

                        <span class="pull-right">
                            {{ $post->created_at->toDayDateTimeString() }}
                        </span>
                    </div>
                    
                    
                      
                    @if(isset($post->image))
                   

                        <div class="panel-heading">
                        
                        <img style=" border-radius:8px;height:480px;width:650px;" class="img-responsive" src="/post_img/{{ $post->image }}" >

                        </div>
                       
                                                    
                    @endisset  
                    @if(isset($post->video_url))
                   

                    <div class="panel-heading" style="position: relative;padding-bottom: 50%">  
                         <iframe   src="{{ $post->video_url }}" width="560" height="315" frameborder="0" scrolling="no" allowfullscreen style="position: absolute;top: 0;left:0;width: 100%;height: 100%;" ></iframe>
                    </div>
                                                    
                    @endisset
                           
                    <div data-postid="{{ $post->id }}" class="panel-body">
                    <h2>Content</h2>
                    <div ><p style="word-wrap:break-word">{{ $post->body }}</p></div>
                        
                       
                        <p>
                            Category: <span  class="label label-success">{{ $post->category->name }}</span> <br>
                            Tags:
                            @forelse ($post->tags as $tag)
                                <span  class="label label-default">{{ $tag->name }}</span>
                            @empty
                                <span  class="label label-danger">No tag found.</span>
                            @endforelse
                        </p>
                        @if(Auth::user())
                            
                            <div >
                            
                                <a  href="#" class="like">{!! Auth::user()->likes()->where('post_id', $post->id)->first() ? Auth::user()->likes()->where('post_id', $post->id)->first()->like == 1 ? 'You like this post' : 'Like' : 'Like'  !!}</a> 

                                <a style = "padding-left: 10px;"  href="#" class="like">{{ Auth::user()->likes()->where('post_id', $post->id)->first() ? Auth::user()->likes()->where('post_id', $post->id)->first()->like == 0 ? 'You don\'t like this post' : 'Dislike' : 'Dislike'  }}</a>
                                
                            </div>
                        @endif
                    </div>
                </div>

                @includeWhen(Auth::user(), 'frontend._form')

                @include('frontend._comments')

            </div>

            <!-- side bar side bar side bar side bar side bar  -->

            <div class="container">
                <div class="row">
                   <div class="col-md-4 panel panel-default">
                   @forelse ($results as $result)
                       <a href="{{ url("/posts/{$result->id}") }}"> 
                        <!-- <div class="panel-heading" >
                           <h4> {{ $result->title }}</h4>
                             <small  class="pull-right"> -{{ $result->user->name }}</small>

                                <div class='row'>
                                @if(isset($result->image))
                                    <div class="col-md-5 ">
                                     <img  class="img-responsive" src="/post_img/{{ $result->image }}" >
                                    </div>
                                @endisset 
                                    <div class="col-md-7 ">
                                    <p>{{ str_limit($result->body, 100) }}</p>
                                    </div>

                                </div>
                         </div> -->
                         <div class="panel-heading" >
                           <h4> {{ $result->title }}</h4>
                            <small class="pull-right">- {{ $result->user->name }}</small>

                                <div class='row'>
                                @if(isset($result->image))
                                    <div class="col-md-5 ">
                                        <img   width="140" height="75" src="/post_img/{{ $result->image }}" >
                                    </div>
                                @endisset  
                                @if(isset($result->video_url))
                                    <div style="position: relative;padding-bottom: 20%;" class="col-md-5 ">
                                    <iframe  style="position: absolute;top: 0;left:0;width: 100%;height: 100%;"  src="{{ $result->video_url }}" width="150" height="95"  scrolling="no" allow='autoplay' frameborder="0" ></iframe>
                                    </div>
                                @endisset
                                    <div class="col-md-7 ">
                                         
                                     </div>

                                </div>
                                <p class="pull-right">{{ str_limit($result->body, 100) }}</p>
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
            <!-- end side bar end side bar end side bar end side bar  -->


        </div>
    </div>
@endsection
