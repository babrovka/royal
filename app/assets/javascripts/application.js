// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//

//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require rails.validations
//= require fotorama
//= require jquery.mousewheel-3.0.6.pack
//= require jquery.fancybox
//= require jquery.fancybox.pack
//= require_self



$(document).ready(
	
	
	
    function(){	
	$(".dynamic_bullshit").on("change", function() {
	 $('#cart_edit').submit();
	});
		
	$("#city_select").change(function () {
		var target = $('#city_select option:selected').val();
		if(target == "moscow") {
		    $('#saint').hide();
		    $('#moscow').show();
		} else {
		    $('#moscow').hide();
			$('#saint').show();
		}
	});
	
	$('#show_photo').on("click", function() {
	  $('#video-gallery').hide();	
      $('#photo-gallery').show();
      $('#publications').hide();
    });

	$('#show_video').on("click", function() {
	  $('#photo-gallery').hide();
	  $('#video-gallery').show();	
	  $('#publications').hide();
    });

	$('#show_publications').on("click", function() {
	  $('#photo-gallery').hide();
	  $('#video-gallery').hide();	
	  $('#publications').show();
    });



	$(".publication").on("mouseover",function () {
		$(this).find('.publication_image_hover').show();
	});
	

	$(".publication").mouseleave(function () {
		$('.publication_image_hover').hide();
	});

	
	/*publications*/
	
	  $('.open').on("click", function() {	
			small = $(this).parent().hide()
			full = $(this).parent().next()
			full.show();
			$(".full").not(full).hide();
	  		$(".short").not(small).show();
	  	  });
	
		  $('.close').on("click", function() {
				$(this).parent().parent().find('.short').show();
				$(this).parent().hide();

		  	  });
	
	
	  /*
	  $('.open').on("click", function() {
	  		
	  		height = $(this).parent().next().height();
	  		self = $(this).parent().height();
	  		
	  		$(this).parent().css('height', self + height + 'px');
	  		$(this).parent().next().show();
	  		
	  		panel = $(this).parent().next()
	  		

	  		
	  		$(".full").not(panel).each(function() {
	  		  $(this).hide();
	  		  height = $(this).prev().height();
	  		  self = $(this).height();
	  		  $(this).prev().css('height', height - self + 'px')
	  		  
	  		});
	  	
	  			return false
	  	  });

	  	  $('.close').on("click", function() {
	  		  height = $(this).parent().height();
	  		  self = $(this).parent().prev().height();
	  		
	  		  
	  		
	  		  $(this).parent().prev().css('height', self - height + 'px');
	  	      $(this).parent().hide();
	  	
	  		return false
	  	  });*/
	  
	
	
/*
		$('#header_submit').on("click", function() {
			$('#header_search').submit();
		});
		
		$('#quick_submit').on("click", function() {
			$('#quick_search').submit();
		});
*/

		
		
		$("#event_city_select").change(function () {		
			var target = $('#event_city_select option:selected').val();
			var pathname = window.location.pathname;
			window.location.assign(pathname + '?city_id=' + target)
			return false	
		});
		

		$(".calendar td").on('click', function () {				
			bubble = $(this).find('.bubble');
			bubble.show();
			$('.bubble').not(bubble).hide();
			
			if(bubble.length == 0) {
				$('.bubble').hide();
			}
				
		});
		
		$(".close").on('click', function () {		
			$(this).parent().hide();
		});		
		
		
		$(".product_image_wrap").mouseover(function () {
			$(this).children().css('visibility', 'visible');
		});
		
		$(".product_image_wrap").mouseleave(function () {
			$(this).children().css('visibility', 'hidden');
			
		});
		
		

		
		
		$("#pre-bubble").on('click', function () {	
			$(this).hide();
			
			$("#bronte-bubble-wrapper").mouseover(function () {
				$('#belter-bubble').hide();	
				$('#bronte-bubble').show();
			});

			$("#belter-bubble-wrapper").mouseover(function () {
				$('#bronte-bubble').hide();	
				$('#belter-bubble').show();
			});
			
		});	
		
		$('#bronte-bubble').on('click', function () {
			window.location = '/products?brand_id=1';
		});
		
		$('#belter-bubble').on('click', function () {
			window.location = '/products?brand_id=2';
		});
		
		
		$(".layer_bg, .close").on('click', function () {
			$(".form").hide();	
			$(".layer_bg").hide();
		});
		
		$("#authorization_link").on('click', function () {		
			$("#register_frame").hide();
			$("#auth_frame").show();	
		});
		
		$("#registration_link").on('click', function () {		
			$("#auth_frame").hide();
			$("#register_frame").show();	
		});
		
		$(".destroy_event").on('click', function () {		
			$(this).parent().parent().remove();
		});
		
		$("#my_cart_link").on('click', function () {
			$('#my_cart').show();		
			$('#my_orders').hide();
			$('#my_events').hide();
			$("#my_cart_link").addClass('active');
			$("#my_orders_link").removeClass('active');
			$("#my_events_link").removeClass('active');
		});
		
		$("#my_orders_link").on('click', function () {
			$('#my_cart').hide();		
			$('#my_orders').show();
			$('#my_events').hide();
			$("#my_cart_link").removeClass('active');
			$("#my_orders_link").addClass('active');
			$("#my_events_link").removeClass('active');
		});
		
		$("#my_events_link").on('click', function () {
			$('#my_cart').hide();		
			$('#my_orders').hide();
			$('#my_events').show();
			$("#my_cart_link").removeClass('active');
			$("#my_orders_link").removeClass('active');
			$("#my_events_link").addClass('active');
		});
		
		$("#saint_print").on('click', function () {
			$('#saint').print();
		});
		
		$("#partners_link").on('click', function () {	
			$('.form').show();	
			$(".layer_bg").show();
			$(".header").show();
		});
		
		$("#registration_link").on('click', function () {	
			$("#register_form").validate();
		});
		
		
		registration_link
		
		$(document).keyup(function(e) {
		  if (e.keyCode == 27) { 
			$(".form").hide();	
			$(".layer_bg").hide();
			 }   // esc
		});
		
	    $(document).ready(function() {
	        $('.fancybox').fancybox();
	    });

		
	
});



