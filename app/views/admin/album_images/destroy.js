$('#<%= @album_image.id %>').fadeOut('fast', function(){
        $(this).remove();
    });