# coding: utf-8

require 'csv'
require 'faker'
require 'populator'
require 'spreadsheet'

# Получает данные листа xls-файла
# Возвращает объект Spreadsheet::Worksheet
def get_xls_spreadsheet file_path, sheet_name
  # Файл не существует?
  raise "Can't find #{file_path}" unless File.exists? file_path

  book = Spreadsheet.open file_path
  sheet = book.worksheet sheet_name

  # Лист не существует?
  raise "Sheet #{sheet} doesn't exists" unless sheet

  return sheet
end


namespace :db do
  
  task :test_brands => :environment do
    Brand.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!(:brands)

    Brand.populate 3 do |brand|
      brand.title = Faker::Lorem.words(1)[0]
    end
  end
  
  task :test_taxonomies => :environment do

    Taxonomy.delete_all

    Taxonomy.populate 5 do |taxonomy|
      taxonomy.title = Faker::Lorem.words(1)[0].capitalize
    end

    puts "Taxonomies created!"

  end

  task :test_nested_taxons => :environment do

    Taxon.delete_all

    # instead of Taxon.reset_pk_sequence!
    # ActiveRecord::Base.connection.reset_pk_sequence!('taxons')

    Taxon.populate 10 do |taxon|
      taxon.title = Faker::Lorem.words(1)[0].capitalize
      taxon.taxonomy_id = Taxonomy.pluck(:id).sample
      taxon.seo_url = Faker::Lorem.words(1)[0]
      print '.'
    end

    puts '+'
    Taxon.rebuild!


    4.times do ||
      root = Taxon.roots.shuffle.first

      5.times do
        taxon = Taxon.new
        taxon.title = Faker::Lorem.words(1)[0].capitalize
        taxon.taxonomy_id = Taxonomy.pluck(:id).sample
        taxon.seo_url = Faker::Lorem.words(1)[0]
        taxon.save!
        print '.'
        taxon.move_to_child_of root
      end
    end

    puts '++'
    Taxon.rebuild!
    puts "Nested taxons created!"

  end

  task :create_cases => :environment do

    Case.destroy_all
    
    ["Жирная кожа, акне", "Пигментация", "Еженедельный уход", "Омолаживающий уход", "Чувствительная кожа, купероз", "Антицеллюлитный уход", "Сухая кожа", "Комбинированная кожа"].each do |case_title|
      product_case = Case.new(:title => case_title)
      product_case.image = File.open(Dir.glob(File.join(Rails.root, 'covers', '*')).sample)
      product_case.save!
    end


    puts "Cases created!"

  end
  
  task :create_products => :environment do
    LineItem.destroy_all
    Product.destroy_all    
    
    Product.populate 100 do |product|
      product.title = Populator.words(1..8).capitalize
      product.packing = ["30 мл", "50 мл", "100 мл"].sample
      product.text = Populator.sentences(10..20)
      product.ingredients = Faker::Lorem.words(10..30)
      product.brand_id = Brand.pluck(:id).sample
      product.taxon_id = Taxon.pluck(:id).sample
      product.visible_professional = true
      product.visible_dealer1 = true
      product.visible_dealer2 = true
      product.visible_dealer3 = true
      product.price_professional = 50
      product.price_dealer1 = 100
      product.price_dealer2 = 200
      product.price_dealer3 = 300
      product.short_description = Populator.sentences(1..10)
      product.position = Array(1..1000).sample
    end
    
    Product.all.each do |product|
      product.cases << Case.all.sample
      product.save!
    end
    
    
    
    Product.find_each(&:save)
    
    puts "Products created!"

  end
  
  task :create_seo_data_objects => :environment do
    SeoData.destroy_all
    SeoData.create(:page => 'Главная страница')
    SeoData.create(:page => 'Продукция главная')
    
    puts "SeoData created!"

  end

  task :create_cities_and_partners => :environment do
    
    # Удаляем старое
    Partner.destroy_all
    
    # Получаем данные
    org_sheet = get_xls_spreadsheet 'db/excel/partners.xls', 'Лист1'

    # Создаем объекты
    org_sheet.each_with_index do |row, index|
      next if index == 0
      city_cell = row[2]
      if city_cell
        city = city_cell.gsub('г. ', '') 
        city = City.where(title: city).first_or_create
        city_id = city.id
      end
      
      Partner.create({
        title: row[1],
        city_id: city_id,
        address: row[3],
        phone: row[4]
      })
    end

    puts "Cities and Partners created!"
  end

  task :test_events => :environment do
    Event.delete_all
    # ActiveRecord::Base.connection.reset_pk_sequence!('events')

    Event.populate 100 do |event|
      event.title = Populator.words(1..8).capitalize
      event.text = Populator.sentences(10..20)
      event.date = rand(15.days).ago
      event.city_id = City.pluck(:id).sample
    end
  end

  task :test_partners => :environment do
    Partner.delete_all
    # ActiveRecord::Base.connection.reset_pk_sequence!('events')

    Partner.populate 100 do |partner|
      partner.title = Populator.words(1..8).capitalize
      partner.address = Populator.words(1..8)
      partner.city_id = City.pluck(:id).sample
      partner.phone = '(812) 718-19-29'
      partner.website = 'hello.com'
    end

    Partner.limit(10).each do |p|
      p.brands << Brand.all.shuffle.first
      p.save!
    end

  end


end


