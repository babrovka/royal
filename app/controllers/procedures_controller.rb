class ProceduresController < ApplicationController
  def index
    @procedures = Procedure.all
  end
  
  def category
    category = ProcedureCategory.find(params[:id])
    categories = category.self_and_descendants
    @procedures = Product.includes(:procedure_categories).where(:procedure_categories => {:id => categories})
  end
  
  def show 
    @procedure = Procedure.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ProcedurePdf.new(@procedure, view_context)
        send_data pdf.render, filename: "procedur_#{@procedure.id}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end
end
