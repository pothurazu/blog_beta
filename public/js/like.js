$(document).ready(function(){

$('.like').on('click', function(event) {
	

     var id=document.getElementById("number").value; 
    var post=document.getElementById("all").value; 
  
console.log(post);
    var URL = id+'/like';
    $.ajax({
        
        url: URL,
        method: 'POST',
        data: {post: post},
        success: function (data) {
            console.log(data)
            alert("success");
        },
        error: function () {
            alert('error');
        }
    });
       
});
});