# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.auto_highlight = true
  navigation.active_leaf_class = 'active-leaf'

  # If you need to add custom html around item names, you can define a proc that
  # will be called with the name you pass in to the navigation.
  # The example below shows how to wrap items spans.
  navigation.name_generator = Proc.new {|name, item| "<span>#{name}</span>"}

  # If this option is set to true, all item names will be considered as safe (passed through html_safe). Defaults to false.
  navigation.consider_item_names_as_safe = true

  navigation.items do |procedure_categories|
    procedure_categories.dom_class = '_left-menu-root-level _left-menu js-left-menu js-left-menu-node'
    Brand.order('title ASC').each do |brand|
      procedure_categories.item "brand-#{brand.id}", brand.title, '#' do |brand_procedure_categories|
        brand_procedure_categories.dom_class = '_left-menu-first-level js-left-menu-node'
        brand.procedure_categories.roots.each do |procedure_category_root|
          brand_procedure_categories.item "procedure-category-#{procedure_category_root.id}",
                                          procedure_category_root.title,
                                          procedures_category_path(procedure_category_root) \
          do |procedure_categories_child|
            procedure_categories_child.dom_class = '_left-menu-second-level js-left-menu-node'
            procedure_category_root.children.each do |procedure_category_child|
              procedure_categories_child.item "procedure-category-#{procedure_category_child.id}",
                                              procedure_category_child.title,
                                              procedures_category_path(procedure_category_child),
                                              class: 'empty'
            end
          end
        end
      end
    end
  end

end
