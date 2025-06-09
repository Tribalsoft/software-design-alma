class CartItemsController < ApplicationController
  def create
    cart = current_cart
    product = Product.find(params[:product_id])
    selected_sizes = Array(params[:sizes])
  
    if selected_sizes.empty?
      redirect_back fallback_location: root_path, alert: t("size_obligatory")
      return
    end
  
    selected_sizes.each do |size|
      item = cart.cart_items.find_by(product_id: product.id, size: size)
  
      if item
        item.increment(:quantity)
      else
        item = cart.cart_items.build(product: product, size: size, quantity: 1)
      end
  
      item.save
    end
  
    flash[:item_added] = true # 🔥 Aquí
    redirect_back fallback_location: root_path
  end
  

  def destroy
    item = current_cart.cart_items.find(params[:id])
    item.destroy
    flash[:item_added] = true # 🔥 Aquí
    redirect_back fallback_location: root_path
  end

  def show
    @cart = current_cart
    @items = @cart.cart_items.includes(:product)
  end

  def update_quantity
  @cart_item = CartItem.find(params[:id])
  new_quantity = params[:quantity].to_i

  if new_quantity > 0
    @cart_item.update(quantity: new_quantity)
  else
    @cart_item.destroy
  end

  respond_to do |format|
    format.turbo_stream do
      render turbo_stream: turbo_stream.replace(@cart_item,
        partial: "cart_items/cart_item", locals: { item: @cart_item })
    end
    format.html { redirect_to cart_path }
  end
end
  

end
