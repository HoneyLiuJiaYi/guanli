class SettlementController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def getSettlement
      @orders = Order.all
      @price = 0
      @arr = []
      @orders.each do |order|
        if params[:data_from] && order.created_at >= params[:data_from]
          h = Hash.new
          @price = @price + order.price
          @product = Product.find(order.product_id)
          h[:id] = order.id
          h[:price] = order.price
          h[:product] = @product.name
          h[:category] = @product.category.name
          h[:time] = order.created_at
          @arr << h
        elsif params[:data_from] == nil
          h = Hash.new
          @price = @price + order.price
          @product = Product.find(order.product_id)
          h[:id] = order.id
          h[:price] = order.price
          h[:product] = @product.name
          h[:category] = @product.category.name
          h[:time] = order.created_at
          @arr << h
        end
      end
      render :json => {:status => 0, :msg => 'success', :data => {:settlement => @arr}}
  end
end
