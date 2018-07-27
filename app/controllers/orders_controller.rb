class OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def new
		@order = Order.new
	end

	def create
		@order = Order.new(order_params)
		
		redirect_to orders_path, notice: 'Pedido criado com sucesso.' if @order.save
	end

	private
		def order_params
			params.require(:order).permit(:total, :status)
		end
end
