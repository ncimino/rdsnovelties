// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$("#left").live("click",function(){
    if ($("#index").val() > 0) {
        end = parseInt($("#index").val()) + 5;
        $("#bt"+$("#index").val()).attr("class","big")
        $("#bt"+end).attr("class","hidden")
        $("#st"+$("#index").val()).attr("class","small selected")
        $("#st"+end).attr("class","small")
        $("#index").val(parseInt($("#index").val()) - 1);
    }
});

$("#right").live("click",function(){
    if ($("#index").val() < 14) {
        $("#index").val(parseInt($("#index").val()) + 1);
        end = parseInt($("#index").val()) + 5;
        $("#bt"+$("#index").val()).attr("class","hidden")
        $("#bt"+end).attr("class","big")
        $("#st"+$("#index").val()).attr("class","small")
        $("#st"+end).attr("class","small selected")
    }
});

