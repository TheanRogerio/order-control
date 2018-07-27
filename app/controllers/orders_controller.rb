class OrdersController < ApplicationController
	before_action :set_order, only: [:edit, :update, :destroy, :show]

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

	def show
	end

	def edit
	end
	
	def update
		if @order.update(order_params)
			redirect_to orders_path, notice: 'Pedido atualizado com sucesso.'
		end
	end

	def destroy
		@order.destroy
		redirect_to orders_path, notice: 'Pedido excluído com sucesso.'
	end

	private
		def set_order
			@order = Order.find(params[:id])
		end

		def order_params
			params.require(:order).permit(:total, :status)
		end
end
