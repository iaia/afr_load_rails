//= require chartkick
//
function refreshSwatch() {
  var red = $("#slider").slider("value");
}
$(function() {
  var sliderMax = document.documentElement.scrollHeight;//$(window).height();
  sliderMax *= 1.3;
  $("#slider").slider({
    orientation: "horizontal",
    range: "min",
    max: sliderMax,
    value: 0,
    slide: refreshSlider,
    change: refreshSlider
  });
});
function refreshSlider() {
  var position = $("#slider").slider("value");
  $(window).scrollTop(position);
}

$(window).scroll(function(){
  var position = $(window).scrollTop(); $("#slider").slider("value", position);
}); 
