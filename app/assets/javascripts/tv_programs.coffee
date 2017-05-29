# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require "watched"
$(document).on "keyup", "#search-movie", (e) ->
  e.preventDefault()
  input = $.trim($(@).val())
  $.ajax({
    url: "/movies/title_search",
    type: "GET",
    data: ("keyword=" + input),
    processData: false,
    contentType: false,
    dataType: "json"
  })
  .done (data) ->
    $("#tv_program_movie_id").find("option").remove()
    $(data).each (i, movie) ->
      $("#tv_program_movie_id").append("<option value=\"" + movie.id + "\">" + movie.title + "</option>")
      
