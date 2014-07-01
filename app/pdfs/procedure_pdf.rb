# coding: utf-8

class ProcedurePdf < Prawn::Document
  def initialize(procedure, view)
    super(margin: 70)
    @procedure = procedure
    @view = view
    russian_font
    belter_logo
    move_down 120
    first_title
    move_down 60
    short_text
    move_down 180
    first_footer
    start_new_page
    move_down 60
    title
    main_text
  end
  
  def belter_logo
    image "#{Rails.root}/app/assets/images/pdf/belter_logo.png", :position => :center
  end
  
  def first_title 
    text @procedure.title, :color => 'F48120', :size => 30, :align => :center
  end
  
  def title 
    text @procedure.title, :color => 'C99541', :size => 25
  end
  
  def short_text 
    span(350, :position => :center) do
     text @procedure.short_text, :size => 10
    end
  end
  
  def first_footer
    image "#{Rails.root}/app/assets/images/pdf/rb_logo.png", :position => :center
  end
  
  def footer
    image "#{Rails.root}/app/assets/images/pdf/rb_logo.png", :position => :left
  end
  
  def main_text
    @procedure.stages.each do |stage|
      text (stage.title + ':'), :color => '002539', :size => 20
      stage.substages.each do |substage|
        text (substage.text + ':'), :color => '002539', :size => 10
      end
    end
  end
  
  def russian_font
    font_families.update(
      "PT Sans" => {
        :bold => "#{Rails.root}/app/assets/fonts/pdf/verdanab.ttf",
        :italic => "#{Rails.root}/app/assets/fonts/pdf/verdanai.ttf",
        :normal  => "#{Rails.root}/app/assets/fonts/pdf/verdana.ttf" })
    font "PT Sans"
  end

end