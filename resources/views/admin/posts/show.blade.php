@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">

            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2>
                            {{ $post->title }} <small>by {{ $post->user->name }}</small>

                            <a href="{{ url('admin/posts') }}" class="btn btn-default pull-right">Go Back</a>
                        </h2>
                    </div>

                    <div class="panel-body">
                        <h3>Content:</h3><p>{{ $post->body }}</p>

                        <p><strong>Category: </strong>{{ $post->category->name }}</p>
                        <p><strong>Tags: </strong>{{ $post->tags->implode('name', ', ') }}</p>
                        @if($post->image != null) 
                        <div class="panel-heading">

                        <img style=" border-radius:8px;height:480px;width:650px;" class="img-responsive" src="/post_img/{{ $post->image }}" >

                        </div>
                 @else
               
                <iframe src=" {{ $post->video_url }} " type="text/html" width="480" height="295" frameborder="0" allowfullscreen ></iframe>

                @endif
                
                    </div>
                </div>
            </div>

        </div>
    </div>
@endsection
