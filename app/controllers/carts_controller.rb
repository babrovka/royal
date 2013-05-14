class CartsController < InheritedResources::Base
  
  def show
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attemp to access invalid cart #{params[:id]}"
      redirect_to products_url, notice: 'Invalid cart'
    else
      respond_to do |format|
        format.html 
        format.json { render json: @cart }
      end
    end
  end
  
  def update
    @cart = Cart.find(params[:id])

    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to action: "edit", notice: 'Cart was successfully updated.' }
        format.js
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @cart = current_cart
    @cart.destroy
    
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Your cart is currently empty' }
      format.js
      format.json { head :no_content }
    end
  end
  
end
