module BreadcrumbsHelper

  # рисуем несколько брендов в линию через запятую
  def breadcrumbs_brands brands
    if brands.any? && brands.count != Brand.count
      content_tag :div, class: '_breadcrumbs-inline-items' do
        brands.map do |brand|
          link_to brand.title, products_path(brand_ids: brand.id), class: '_breadcrumbs-item'
        end.join.html_safe
      end
    end
  end

  def breadcrumbs_taxons taxon
    out = []
    if taxon
      out << link_to(taxon.root.try(:title), taxon_path(taxon.root), class: '_breadcrumbs-item')
      unless taxon.root?
        out << link_to(taxon.title, taxon_path(taxon), class: '_breadcrumbs-item')
      end
    end

    out.join.html_safe
  end

  def breadcrumbs_taxonomy taxonomy
    if taxonomy
      link_to(taxonomy.try(:title), taxonomy_path(taxonomy), class: '_breadcrumbs-item')
    end
  end

end