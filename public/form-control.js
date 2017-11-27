// 

$(function(){
    $('#post_title').val("재미써?");
    $('#post_title').on('change', function(){
       var text = $('#post_title').val();
       console.log(text);
    });
});