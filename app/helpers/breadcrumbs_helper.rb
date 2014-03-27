module BreadcrumbsHelper
  def render_brands brands
    if brands.any?
      content_tag :div, class: '_breadcrumbs-inline-items' do
        brands.map do |brand|
          link_to brand.title, products_path(brand_ids: brand.id), class: '_breadcrumbs-item'
        end.join.html_safe
      end
    end
  end
end