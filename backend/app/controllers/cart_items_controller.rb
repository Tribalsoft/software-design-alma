class CartItemsController < ApplicationController
  def create
  cart = current_cart
  product = Product.find(params[:product_id])

  sizes = Array(params[:sizes].presence || params[:size])
  quantity = params[:quantity].to_i > 0 ? params[:quantity].to_i : 1

  if sizes.empty?
    redirect_back fallback_location: root_path, alert: t("size_obligatory")
    return
  end

  sizes.each do |size|
    item = cart.cart_items.find_by(product_id: product.id, size: size)

    if item
      item.quantity += quantity
    else
      item = cart.cart_items.build(product: product, size: size, quantity: quantity)
    end

    item.save
  end

  flash[:item_added] = true
  redirect_back fallback_location: root_path
  end
  

  def destroy
  item = current_cart.cart_items.find(params[:id])
  item_id = item.id
  item.destroy
  current_cart.reload

  cart_count = current_cart.cart_items.sum(:quantity)

  respond_to do |format|
    format.turbo_stream do
      render turbo_stream: [
        turbo_stream.remove("cart_item_#{item_id}"),
        turbo_stream.replace("cart_count", partial: "shared/cart_count"),
        turbo_stream.replace("total_price", partial: "shared/total_price"),

        # Actualiza ícono para escritorio
        turbo_stream.replace("cart_icon_xl", partial: "shared/cart_icon", locals: {
          icon_id: "cart-toggle-xl",
          extra_classes: "d-none d-lg-flex",
          cart_items_count: cart_count
        }),

        # Actualiza ícono para mobile
        turbo_stream.replace("cart_icon_mobile", partial: "shared/cart_icon", locals: {
          icon_id: "cart-toggle",
          extra_classes: "d-lg-none",
          cart_items_count: cart_count
        })
      ]
    end
    format.html { redirect_back fallback_location: root_path }
  end
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
    format.turbo_stream
    format.html { redirect_to root_path }
  end
end
  

end
