$(function() {
  $('#cropbox').Jcrop({
    onChange: update_crop,
    onSelect: update_crop,
    setSelect: [0, 0, 300, 300],
    aspectRatio: 300/300,
	boxWidth: 600
  });
});

function update_crop(coords) {
	$('#main').css({
		width: Math.round(300/coords.w * $('#cropbox').width()) + 'px',
		height: Math.round(300/coords.h * $('#cropbox').height()) + 'px',
		marginLeft: '-' + Math.round(300/coords.w * coords.x) + 'px',
		marginTop: '-' + Math.round(300/coords.h * coords.y) + 'px'
	});

  $("#product_image_crop_x").val(Math.round(coords.x));
  $("#product_image_crop_y").val(Math.round(coords.y));
  $("#product_image_crop_w").val(Math.round(coords.w));
  $("#product_image_crop_h").val(Math.round(coords.h));
};
