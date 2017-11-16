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
//= require rails-ujs
//= require turbolinks
//= require_tree .
(function($, document, window){

	$(document).ready(function(){

		// Cloning main navigation for mobile menu
		$(".mobile-navigation").append($(".main-navigation .menu").clone());

		// Mobile menu toggle
		$(".toggle-menu").click(function(){
			$(".mobile-navigation").slideToggle();
		});

		$(".home-slider").flexslider({
			controlNav: true,
			directionNav: false
		});

		$(".login-button").on("click",function(){
			$(".overlay").fadeIn();
			$(".auth-popup").toggleClass("active");
		});

		$(".close, .overlay").on("click",function(){
			$(".overlay").fadeOut();
			$(".popup").toggleClass("active");
		});

		initLightbox({
	    	selector : '.product-images a',
	    	overlay: true,
	    	closeButton: true,
	    	arrow: true
	    });


		$(document).keyup(function(e) {
			if( $(".popup").hasClass("active")){
		  		if (e.keyCode === 27) {
		  			$(".overlay").fadeOut();
					$(".popup").toggleClass("active");
		  		}
			}
		});
	});

	$(window).load(function(){

	});

})(jQuery, document, window);
