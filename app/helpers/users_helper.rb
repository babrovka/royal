# coding: utf-8

module UsersHelper
  
  def partner_link
    if user_signed_in?
      link_to "личный кабинет", account_path, :class => 'partners_link'
    else
      link_to "вход для партнеров", "#", :class => 'partners_link', :id => 'partners_link'
    end
  end
  
end
