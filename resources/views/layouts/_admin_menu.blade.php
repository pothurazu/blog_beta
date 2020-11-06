<ul class="nav navbar-nav">
<!-- <li><a href="{{ url('admin/posts') }}">My Posts</a></li> -->
<!-- <li><a href="{{ url('admin/posts/create') }}">upload</a></li> -->
    @if (Auth::user()->is_admin)
    <li class="dropdown">
        <button href="#"style="outline:none;border:none;background:none;margin-top:15px" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
            Options
             <span class="caret"></span>
</button>

        <ul class="dropdown-menu" role="menu">
        <li><a href="{{ url('admin/users') }}">Users</a></li>
            <!-- <li><a href="{{ url('admin/posts') }}">Posts</a></li> -->
        <li><a href="{{ url('admin/categories') }}">Categories</a></li>
        <li><a href="{{ url('admin/comments') }}">Comments</a></li>
        <li><a href="{{ url('admin/tags') }}">Tags</a></li>
                                    
        </ul>
                                
    </li>
    @endif


    
</ul>
