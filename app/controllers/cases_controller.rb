# coding: utf-8

class CasesController < ApplicationController

  def show
    @case = Case.find(params[:id])
    @title = @case.seo_title
    @meta_description = @case.seo_description
    @products = @case.products
  end
    
end
