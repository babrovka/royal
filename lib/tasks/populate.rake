# coding: utf-8

require 'csv'
require 'faker'
require 'populator'

namespace :db do
  task :import_taxons => :environment do
    
    Taxon.destroy_all
    
    Taxon.populate 20 do |taxon|
      taxon.title = Faker::Lorem.words(1)[0].capitalize
      taxon.taxonomy_id = Taxonomy.pluck(:id).sample
    end
    
    puts "Taxons created!"

  end
  
  task :add_taxons_to_products => :environment do
    
    Product.all.each do |product|
      product.taxon_ids = Taxon.pluck(:id).sample(5)
      product.save!
    end
    
    puts "Taxons added!"

  end
end


