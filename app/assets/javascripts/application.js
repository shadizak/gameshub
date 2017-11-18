// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require turbolinks
//= require rails-ujs
//= require jquery_ujs
//= require jquery-3.2.1
//= require jquery-ui-1.12.1.custom.min
//= require popper
//= require bootstrap-switch.min
//= require bootstrap.min
//= require nouislider
//= require moment.min
//= require bootstrap-datetimepicker.min
//= require paper-kit
//= require_self

$(document).ready(function() {
  $("#head").mouseenter(function() {
     $(this).css("color", "#E6E6FA");
  });
	$("#head").mouseleave(function() {
		 $(this).css("color", "#fff");
	});
});
