module TaxonsHelper
  
  def taxon_seo_path(taxon)
    if taxon.taxonomy
      taxon_path(taxon.taxonomy.slug, taxon)
    else
      taxon_path('no_taxonomy', taxon)
    end
  end
  
end
