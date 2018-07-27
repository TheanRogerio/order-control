class OrdersController < ApplicationController
	before_action :set_order, only: [:edit, :update]

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

	def edit
	end
	
	def update
		if @order.update(order_params)
			redirect_to orders_path, notice: 'Pedido atualizado com sucesso.'
		end
	end

	private
		def set_order
			@order = Order.find(params[:id])
		end

		def order_params
			params.require(:order).permit(:total, :status, )
		end
end
