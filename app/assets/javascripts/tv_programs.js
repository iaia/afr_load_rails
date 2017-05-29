# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require "watched"
$(document).on("turbolinks:load", function() {
  $(document).on("keyup", "#tv_program_movie", function(){
    e.preventDefault();
    var input = $.trim($(this).val());
    $.ajax({
      url: "/movies/title_search",
      type: "GET",
      data: ("keyword=" + input),
      processData: false,
      contentType: false,
      dataType: "json"
    })
  });
});
