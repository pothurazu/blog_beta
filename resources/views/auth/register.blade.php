@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Register</div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" method="POST" action="{{ route('register') }}">
                        {{ csrf_field() }}


                        <!-- <label for="name" class="col-md-4 control-label">Register With</label>
                           <div class="col-md-6">
                               <a href="{{ url('login/facebook') }}" class="btn btn-social-icon btn-facebook"><i class="fa fa-facebook"></i></a>
                               <a href="{{ url('login/google') }}" class="btn btn-social-icon btn-google-plus"><i class="fa fa-google-plus"></i></a>
                               
                           </div> -->
                        <!-- <button class="loginBtn loginBtn--facebook" style="left:134px">
                            Register with Facebook
                        </button>

                        <button class="loginBtn loginBtn--google" style="left:139px">
                            Register with Google
                        </button> -->
                        <a href="{{ url('login/facebook') }}" class="loginBtn loginBtn--facebook" style="left:134px">
                                Register with Facebook
                            </a>

                            <a href="{{ url('login/google') }}" class="loginBtn loginBtn--google" style="left:139px">
                            Register with Google
                            </a>



                        <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">

                            <label for="name" class="col-md-4 control-label">Name</label>

                            <div class="col-md-6">

                                @if(!empty($name))

                                <input id="name" type="text" class="form-control" name="name" value="{{$name}}" required autofocus>

                                @else

                                <input id="name" type="text" class="form-control" name="name" value="{{ old('name') }}" required autofocus>

                                @endif

                                @if ($errors->has('name'))

                                <span class="help-block">

                                    <strong>{{ $errors->first('name') }}</strong>

                                </span>

                                @endif

                            </div>

                        </div>

                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">

                            <label for="email" class="col-md-4 control-label">E-Mail Address</label>

                            <div class="col-md-6">

                                @if(!empty($email))

                                <input id="email" type="email" class="form-control" name="email" value="{{$email}}" required>

                                @else

                                <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required>

                                @endif

                                @if ($errors->has('email'))

                                <span class="help-block">

                                    <strong>{{ $errors->first('email') }}</strong>

                                </span>

                                @endif

                            </div>

                        </div>



                        <!-- <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                            <label for="name" class="col-md-4 control-label">Name</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control" name="name" value="{{ old('name') }}" required autofocus>

                                @if ($errors->has('name'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <label for="email" class="col-md-4 control-label">E-Mail Address</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required>

                                @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div> -->

                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <label for="password" class="col-md-4 control-label">Password</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control" name="password" required>

                                @if ($errors->has('password'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('password') }}</strong>
                                </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password-confirm" class="col-md-4 control-label">Confirm Password</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    Register
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection