class OrdersController < InheritedResources::Base
  
  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to products_url, notice: "Your cart is empty"
      return
    end
    
    @order = Order.new
    respond_to do |format|
      format.html 
    end
    
  def create
    @order = Order.new(params[:order])
    @order.user_id = current_user.id
    @order.add_line_items_from_cart(current_cart)
    
    respond_to do |format|
      if @order.save
        Cart.destroy(current_cart.id)
        format.html { redirect_to products_path, notice: "Thanks for your order" }
      else
        @cart = current_cart
        format.html { render action: "new" }
      end
    end
  end
  end
    
end
