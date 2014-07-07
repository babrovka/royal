//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require jquery.Jcrop.js
//= require active_admin_custom.js

//= require active_admin/application
//= require select2


$(document).ready(function(){
	$('.select2able').select2({
	    width: 300,
			formatNoMatches: function(term) {return 'Ничего не найдено';}
	});

});

$(document).on('click', '.has_many.stages a.button, .has_many.substages a.button', function(){ $('select').not('.select2-offscreen').select2({width: 300, formatNoMatches: function(term) {return 'Ничего не найдено';}}) })