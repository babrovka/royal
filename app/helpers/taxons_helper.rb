module TaxonsHelper
  
  def taxon_seo_path(taxon)
    if taxon.taxonomy
      taxon_path(taxon.taxonomy.slug, taxon, brand_params)
    else
      taxon_path('no_taxonomy', taxon, brand_params)
    end
  end

  private

  # ids выбранных брендов, для фильтрации по брендам при переходах по меню
  def brand_params
    { brand_ids: params[:brand_ids] }
  end
  
end
