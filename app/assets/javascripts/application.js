// This is a manifespi file that'll be compiled into including all the files lispied below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$("#left").live("click",function(){
    on = parseInt($("#index").val()) - 1
    off = on + parseInt($("#show").val())
    max = parseInt($("#max").val())
    thumb_max = on + parseInt($("#thumb_max").val())
    if (on >= 0) {
        $("#index").val(on);
        $("#spi"+off).attr("class","small")
        $("#spi"+on).attr("class","small selected")
        $("#bpi"+off).attr("class","hidden")
        $("#bpi"+on).attr("class","big")
        if (thumb_max <= max) {
            $("#spi"+thumb_max).attr("class","hidden")
            $("#right_more").attr("class","")
        }
        if (on == 0) {
            $("#left_more").attr("class","hidden")
        }
    }
});
$("#right").live("click",function(){
    off = parseInt($("#index").val())
    on = off + parseInt($("#show").val())
    max = parseInt($("#max").val())
    thumb_max = on - parseInt($("#thumb_max").val())
    if (on < max) {
        $("#index").val(off + 1);
        $("#spi"+off).attr("class","small")
        $("#spi"+on).attr("class","small selected")
        $("#bpi"+off).attr("class","hidden")
        $("#bpi"+on).attr("class","big")
        if (thumb_max >= 0) {
            $("#spi"+thumb_max).attr("class","hidden")
            $("#left_more").attr("class","")
        }
        if (on+1 >= max) {
            $("#right_more").attr("class","hidden")
        }
    }
});
