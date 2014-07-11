# coding: utf-8

class ProcedurePdf < Prawn::Document
  def initialize(procedure, view)
    super(margin: 60)
    @procedure = procedure
    @view = view
    init_fonts
    first_page_logo
    first_page_title
    first_page_footer

    start_new_page

    main_text

    repeatable_footer
  end

  # повторяем футер на всех кроме главной страницы
  def repeatable_footer
    footer_height = 100
    repeat(lambda { |pg| pg != 1 }) do
      bounding_box([0, 0],  width: bounds.width, height: footer_height) do
        image "#{Rails.root}/app/assets/images/pdf/rb_logo.png", :position => :left, width: 150

        text_width = 150
        bounding_box([bounds.width - text_width, footer_height], width: text_width, height: footer_height) do
          font 'PTSansCondensed'
          text "Эксклюзивный дистрибьютор в России\nкомпания «Роял Брендс»\n8(800)100-8079, www.rbcos.ru",
               color: '333333',
               size: 9
        end
      end
    end
  end

  # футер на главной странице
  def first_page_footer
    footer_height = 100
    bounding_box([0, 0], width: bounds.width, height: footer_height) do
      image "#{Rails.root}/app/assets/images/pdf/rb_logo.png", :position => :center, width: 150
    end
  end
  
  def first_page_logo
    if @procedure.brand
      bounding_box([0, bounds.height], width: bounds.width, height: 200) do
        image "#{Rails.root}/app/assets/images/pdf/logo-brand-#{@procedure.brand.try(:id)}.png", :position => :center, fit: [200, 200]
      end
    end
  end
  
  def first_page_title
    bounding_box([0, bounds.height/2 + 100], width: bounds.width) do
      font 'Bebas'
      text @procedure.title, :color => 'F48120', :size => 35, :align => :center
      move_down 60
      first_page_short_text
    end
  end
  

  def first_page_short_text
    span(350, :position => :center) do
      font 'PTSansRegular'
      text @procedure.title, :size => 9
    end
  end
  

  

  def main_text
    bounding_box([0, bounds.height], width: bounds.width, height: bounds.height - 100) do
      font 'Bebas'
      text @procedure.title, :color => 'C99541', :size => 22
      move_down 20
      num = 0
      font 'PTSansRegular'
      @procedure.stages.each do |stage|
        text (stage.title + ':'), :color => '002539', :size => 14
        move_down 7
        # формируем то,что будем рисовать
        # в каждой строчке порядковый номер и текст
        rows = []
        stage.substages.each do |substage|
          num += 1
          rows.push ["#{num}.", substage.text]
        end

        # рисуем таблицу
        indent 20 do
          table rows, cell_style: { border_width: 0, color: '002539', padding: [5,3], size: 9 }
        end
        move_down 12
      end
    end
  end
  
  def init_fonts
    font_families.update(
      'PTSansCondensed' =>{
        normal: "#{Rails.root}/app/assets/fonts/pdf/OpenSans-Condensed.ttf"
      },
      'PTSansRegular' => {
          normal: "#{Rails.root}/app/assets/fonts/pdf/OpenSans-Regular.ttf"
      },
      'Bebas' =>{
        :normal => "#{Rails.root}/app/assets/fonts/pdf/BebasNeue Regular.ttf"
      }
    )
  end


end