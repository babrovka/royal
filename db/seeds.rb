# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require 'csv'
# 
# puts "Importing regions..."
# CSV.foreach(Rails.root.join("regions.csv"), headers: true) do |row|
#   Region.create! do |region|
#     region.id = row[0]
#     region.name = row[1]
#   end
# end

Rake::Task['db:import_products'].invoke
Rake::Task['db:import_taxons'].invoke
Rake::Task['db:add_taxons_to_products'].invoke