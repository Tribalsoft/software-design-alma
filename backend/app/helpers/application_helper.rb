module ApplicationHelper

  def cart_items_count
  current_cart.cart_items.sum(:quantity)
  end

end
