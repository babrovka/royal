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

    %Q{<iframe title="YouTube video player" width="500" height="350" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}
  end
  
  def appointment_link(event)
    if controller_name == "users"
      css = "destroy_event"
    else
      css = "appointment_button"
    end
    
    
    if current_user.events.exists?(event)
      link_to 'Отписаться', event, method: :delete, :remote => true, :class => css
    else
      link_to 'Записаться', events_path(event_id: event), method: :post, :remote => true, :class => css
    end
  end
  
  def who_goes(event)
     event.users.count
  end
  
  def controller?(*controller)
     controller.include?(params[:controller])
   end

   def action?(*action)
     action.include?(params[:action])
   end
   
   def nav_link(link_text, link_path)
     class_name = current_page?(link_path) ? 'active' : ''
     link_to link_text, link_path, :class => class_name
   end


   
   def city(event)
     city = event.try(:city_id)
     City.exists?(city) ? City.find(city).try(:title) : ""
     
   end
   
   def resource_name
       :user
   end

   def resource
     @resource ||= User.new
   end

   def devise_mapping
     @devise_mapping ||= Devise.mappings[:user]
   end
   
   def markdown(text)
     Redcarpet.new(text, :hard_wrap).to_html.html_safe
   end
   
   def special_markdown(number, text)
     text = number.to_s + '.&nbsp;' + text 
     Redcarpet.new(text, :hard_wrap).to_html.html_safe
   end
   
   def title
      base_title = "Royal Beauty"
      if @title
        "#{@title} | #{base_title}"
      else
        base_title
      end
    end
    
    def meta_description
      base_meta_description = ""
      base_meta_description
      if @meta_description.nil?
        base_meta_description
      else
        @meta_description
      end
    end


  
end