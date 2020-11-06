<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">

<head>
    <!-- BEGIN SHAREAHOLIC CODE -->
<link rel="preload" href="https://cdn.shareaholic.net/assets/pub/shareaholic.js" as="script" />
<meta name="shareaholic:site_id" content="f97a88219cfb95498a2eb7d240d4b346" />
<script data-cfasync="false" async src="https://cdn.shareaholic.net/assets/pub/shareaholic.js"></script>
<!-- END SHAREAHOLIC CODE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Blog_v425') }}</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/slide.css') }}" rel="stylesheet">

    <!-- Scripts -->
    <script>
        window.Laravel = {
            !!json_encode(['csrfToken' => csrf_token(), ]) !!
        };
    </script>

</head>


<body style="padding-top: 0px;padding-left: 0px;padding-right: 0px;">
    <div class="row">
        <div class="col-md-2 col-xs-2">
            <div class="col-md-4">
                <a type="button" id="sidebarCollapse">
                    <i class="fa fa-bars fa-2x" style="margin-left:10px;margin-top:11px;" aria-hidden="true"></i>

                </a>
            </div>
            <div class="col-md-4">
            <a class="navbar-brand" href="{{ url('/') }}">article </a>
            </div>

           
        </div>

        <!-- <div class="col-md-1 col-xs-1"> -->

        <!-- </div> -->
        <div class="col-md-6 col-xs-2">
            @include('frontend._search')
        </div>
        <div class="col-md-4 col-xs-8 carett">
            <ul class="nav navbar-nav ">
                @includeWhen(Auth::user(), 'layouts._admin_menu')
                <!-- Authentication Links -->
                @if (Auth::guest())
                <li><a href="{{ route('login') }}">Login</a></li>
                <li><a href="{{ route('register') }}">Register</a></li>
                @else
                <li>
                    <a style="outline:none;border:none;margin-top:3px" href="{{ url('admin/posts/create') }}">upload</a>
                </li>
                <li class="dropdown">
                    <button style="outline:none;border:none;background:none;margin-top:15px" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                        {{ Auth::user()->name }} <span class="caret"></span>
                    </button>

                    <ul class="dropdown-menu" role="menu">

                        <li><a href="{{ url('admin/posts') }}">My Posts</a></li>
                        <li><a href="{{ url('/profile') }}">Profile</a></li>
                        <li>
                            <a href="{{ route('logout') }}" onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                Logout
                            </a>

                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                {{ csrf_field() }}
                            </form>
                        </li>
                    </ul>

                </li>

                @endif
            </ul>


        </div>



    </div>
    <div id="app" class="wrapper">
        <nav id="sidebar" style="padding-top: 0px;">


            <ul class="list-unstyled components" style="padding-top: 0px;">
                <li class="active">
                    <a href="{{ url('/') }}">
                        <i class="glyphicon glyphicon-home"></i>
                        Home
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-history" aria-hidden="true"></i>

                        Recent
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-thumbs-up"></i>

                        Most Liked
                    </a>
                </li>

                <li>

                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false">

                        <i class="fa fa-list-alt" aria-hidden="true"></i>
                        Categories
                    </a>
                    <ul class="collapse list-unstyled" id="homeSubmenu">
                        <li><a href="#">Health</a></li>
                        <li><a href="#">Science</a></li>
                        <li><a href="#">Sci-Fi</a></li>
                    </ul>
                </li>

                <!-- <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">
                        <i class="glyphicon glyphicon-duplicate"></i>
                        Pages
                    </a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li><a href="#">Page 1</a></li>
                        <li><a href="#">Page 2</a></li>
                        <li><a href="#">Page 3</a></li>
                    </ul>
                </li> -->
                <!-- <li>
                        <a href="#">
                            <i class="glyphicon glyphicon-link"></i>
                            Portfolio
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="glyphicon glyphicon-paperclip"></i>
                            FAQ
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="glyphicon glyphicon-send"></i>
                            Contact
                        </a>
                    </li>
                </ul> -->

                <ul class="list-unstyled CTAs">
                    <li><a href="#" >Liked Posts</a></li>
                    <li><a href="#" class="article">Terms $Conditon</a></li>
                    <!-- <li>Login</li>
                    <li>Register</li> -->
                </ul>
        </nav>
        <div id="content" style="padding-top: 0px;padding-left: 0px;">



            <div class="container">
                <div class="row">
                    @include('flash::message')
                </div>
            </div>

            @yield('content')
        </div>
    </div>

    <!-- Scripts  -->
    <script src="{{ asset('js/app.js') }}"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            console.log("hi");
            $('#sidebarCollapse').on('click', function() {
                $('#sidebar').toggleClass('active');
            });
        });
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="{{ asset('js/share.js') }}"></script>
    <script type="text/javascript">
        $('#type').on('change', function() {
            if ($(this).val() === 'image') {
                $("#img").show()
                $("#vdo").hide()

            } else if ($(this).val() === 'video') {
                $("#img").hide()
                $("#vdo").show()

            }

        });
    </script>
    <script src="{{ asset('/js/like.js') }}"></script>

    <script>
        var token = '{{ Session::token() }}';
        var urlLike = '{{ url('
        like ') }}';
    </script>
    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('#category-img-tag').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#image").change(function() {
            readURL(this);
        });
    </script>

</body>

</html>