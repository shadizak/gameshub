// script for scrolling user when hitting seach in (products#index)
$(document).ready(function() {
  // $('body,html').animate({
  //   scrollTop: 600
  // }, 800);
  $('html, body').animate({
       scrollTop: $("#search_result").offset().top + offset
     }, 2000);
});
