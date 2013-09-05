$('#<%= @product_image.id %>').fadeOut('fast', function(){
        $(this).remove();
    });