class OrdersController < ApplicationController
	before_action :set_item, only: [:edit, :update, :destroy]
	before_action :set_params

	def index
		@items = Order.left_outer_joins(:order_items).distinct
						.select('orders.*, SUM(order_items.price * order_items.quantity) 
						AS total').group('orders.id')
		# @total = OrderItems.where(OrderItem.order_id = @items.id)
	end

	def new
		@item = Order.new
		render 'template/new'
	end

	def create
		@item = Order.new(item_params)
		
		redirect_to orders_path, notice: 'Pedido criado com sucesso.' if @item.save
	end

	def edit
		render 'template/edit'
	end
	
	def update
		if @item.update(item_params)
			redirect_to orders_path, notice: 'Pedido atualizado com sucesso.'
		end
	end

	def destroy
		@item.destroy
		redirect_to orders_path, notice: 'Pedido excluído com sucesso.'
	end

	private
		def set_params
			@columns = ["Nº do pedido", "Status", "Valor total", "Usuário"]
			@column_titles = ["id", "status", "total", "user_id"]
			@title = 'pedido'
		end

		def set_item
			@item = Order.find(params[:id])
		end

		def item_params
			params.require(:order).permit(:status, :user_id)
		end
end
