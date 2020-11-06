@extends('layouts.app')

@section('content')
<div class="row">
@foreach ($posts as $post)
   <div class="col-md-3" >
    
        @if(isset($post->image))
                <!-- <div class="col-md-12 " > -->
                    <img   width="253px" height="142px" src="/post_img/{{ $post->image }}" >
                <!-- </div> -->
            @endisset  
    
          
            @if(isset($post->video_url))
                <!-- <div style="position: relative;padding-bottom: 20%;" class="col-md-5 ">

                        <iframe style="position: absolute;top: 0;left:5;width: 100%;height: 100%;"  src=" {{ $post->video_url }} " width="253px" height="142px" frameborder="0" scrolling="no"></iframe>
                </div>  -->
                <!-- <div  class="col-md-12 " > -->
                        <iframe  width="253px" height="142px"  src=" {{ $post->video_url }} "  frameborder="0" scrolling="no"></iframe>
                <!-- </div>    -->

            @endisset
           
            <div>
                  <h4 style="color:grey;font-weight: 500;"> {{ str_limit($post->title,50) }} <a href="{{ url("/posts/{$post->id}") }}" style="color:black">.....</a></h4>
                  
            </div>  
            <p>
                                    
                </p>
            <small>-{{ $post->user->name }}</small>

            <span class="pull-right" style="margin-right: 21px;">
           
                {{ $post->created_at->diffForHumans() }}
            </span> 
             <br> <br> <br>
   </div>
  
   @endforeach


</div>

@endsection
