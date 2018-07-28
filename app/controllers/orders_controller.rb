class OrdersController < ApplicationController
	before_action :set_item, only: [:edit, :update, :destroy, :show]
	before_action :set_params

	def index
		@items = Order.select(:id, :total, :status, :created_at, :updated_at)
		render 'template/index'
	end

	def new
		@item = Order.new
		render 'template/new'
	end

	def create
		@item = Order.new(item_params)
		
		redirect_to orders_path, notice: 'Pedido criado com sucesso.' if @item.save
	end

	def show
		render 'template/show'
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
			@columns = ["ID", "Total", "Status", "Criado em", "Atualizado em"]
			@column_titles = ["id", "total", "status", "created_at", "updated_at"]
			@title = 'pedido'
		end

		def set_item
			@item = Order.find(params[:id])
		end

		def item_params
			params.require(:order).permit(:total, :status)
		end
end
