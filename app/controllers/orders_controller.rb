class OrdersController < ApplicationController
  def index
    @orders = Pages::Orders::List.new.invoke
  end

  def show
    @order = Pages::Orders::Detail.new.invoke(params[:id])
  end
end