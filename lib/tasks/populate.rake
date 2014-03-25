# coding: utf-8

require 'csv'
require 'faker'
require 'populator'

namespace :db do
  task :create_taxons => :environment do
    Taxon.destroy_all
    Taxon.populate 20 do |taxon|
      taxon.title = Faker::Lorem.words(1)[0].capitalize
      taxon.taxonomy_id = Taxonomy.pluck(:id).sample
    end
    
    Taxon.find_each(&:save)
    Taxon.rebuild!
    
    puts "Taxons created!"

  end


  task :test_nested_taxons => :environment do

    Taxon.delete_all

    # instead of Taxon.reset_pk_sequence!
    ActiveRecord::Base.connection.reset_pk_sequence!('taxons')

    Taxon.populate 5 do |taxon|
      taxon.title = Faker::Lorem.words(1)[0].capitalize
      taxon.taxonomy_id = Taxonomy.pluck(:id).sample
      print '.'
    end

    puts '+'
    Taxon.rebuild!


    10.times do
      taxon = Taxon.new
      taxon.title = Faker::Lorem.words(1)[0].capitalize
      taxon.taxonomy_id = Taxonomy.pluck(:id).sample
      taxon.save!
      print '.'
      taxon.move_to_child_of Taxon.roots.first
    end

    puts '++'
    Taxon.rebuild!

    #20.times do
    #  taxon = Taxon.new
    #  taxon.title = Faker::Lorem.words(1)[0].capitalize
    #  taxon.taxonomy_id = Taxonomy.pluck(:id).sample
    #  taxon.save!
    #  print '.'
    #  taxon.move_to_child_of Taxon.roots.first.children.sample
    #end
    #
    #puts '+++'
    #Taxon.rebuild!

    puts "Nested taxons created!"

  end

  task :test_taxonomies => :environment do

    Taxonomy.delete_all

    Taxonomy.populate 5 do |taxonomy|
      taxonomy.title = Faker::Lorem.words(1)[0].capitalize
    end

    puts "Taxonomies created!"

  end
  
  task :create_products => :environment do
    LineItem.destroy_all
    Product.destroy_all
    
    Product.populate 100 do |product|
      product.title = Faker::Lorem.words(1)[0].capitalize
      product.packing = ["30 мл", "50 мл", "100 мл"].sample
      product.text = Populator.sentences(10..20)
      product.ingredients = Faker::Lorem.words(10..30)
      product.brand_id = [1, 2, 3].sample
      product.taxon_id = Taxon.pluck(:id).sample
      product.visible_professional = true
      product.visible_dealer1 = true
      product.visible_dealer2 = true
      product.visible_dealer3 = true
      product.price_professional = 50
      product.price_dealer1 = 100
      product.price_dealer2 = 200
      product.price_dealer3 = 300
      product.short_description = Populator.sentences(2..5)
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
end


