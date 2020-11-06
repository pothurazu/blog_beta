<div class="row form-search">
    {!! Form::open(['method' => 'GET', 'role' => 'form']) !!}
            <div class="col-md-10 col-xs-8" style="margin-top:8px;">
                {!! Form::text('search', request()->get('search'), ['class' => 'form-control', 'placeholder' => 'Search...']) !!}
               
            </div>
            <div class="col-md-1 col-xs-2" style="margin-top: 13px;padding-left: 0px;padding-right: 0px;">
           
            <button type="submit" class="fa fa-search " style="outline:none;border:none;background:#fafafa"></button>
             
            </div>
    {!! Form::close() !!}
</div>
