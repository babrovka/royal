# coding: utf-8

module ApplicationHelper
    
  def youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end

    %Q{<iframe title="YouTube video player" width="220" height="140" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}
  end
  
  def appointment_link(event)
    if controller_name == "users"
      css = "appointment_link destroy"
    else
      css = "appointment_link"
    end
    
    if current_user.events.exists?(event)
      link_to 'Отписаться', event, method: :delete, :remote => true, :class => css, :id => event.id
    else
      link_to 'Записаться', events_path(event_id: event), method: :post, :remote => true, :class => css, :id => event.id
    end
  end
  

  
end