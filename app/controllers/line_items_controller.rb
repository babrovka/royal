class LineItemsController < InheritedResources::Base
  
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    
    respond_to do |format|
      if @line_item.save
      format.html { redirect_to products_path }
      format.js
      else
        format.html  { render action: "new" }
      end
    end
  end
  
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to products_path }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @cart = current_cart
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to account_path }
      format.js { @cart = current_cart }
    end
  end
  
  def increase 
    @cart = current_cart
    @line_item = LineItem.find(params[:id])
    
    @line_item.quantity += 1
    @line_item.save
    
    respond_to do |format|
      format.html { redirect_to account_path }
      format.js { @cart = current_cart }
    end
  end
  
  def decrease 
    @cart = current_cart
    @line_item = LineItem.find(params[:id])

    
    if @line_item.quantity <= 1
      destroy
    else
      @line_item.quantity -= 1
      @line_item.save
    end
    
    respond_to do |format|
      format.html { redirect_to account_path }
      format.js { @cart = current_cart }
    end
  end
  
end
