class ProductsController < ApplicationController
	before_action :set_item, only: [:edit, :update, :destroy]
	before_action :set_params

	def index
		# @items = Product.left_outer_joins(:product_items).distinct
		# 				.select('products.*, SUM(product_items.price * product_items.quantity) 
    # 				AS total').group('products.id')
    @items = Product.all
		render 'template/index'
	end

	def new
		@item = Product.new
		render 'template/new'
	end

	def create
		@item = Product.new(item_params)
		
		redirect_to products_path, notice: 'Produto criado com sucesso.' if @item.save
	end

	def edit
		render 'template/edit'
	end
	
	def update
		if @item.update(item_params)
			redirect_to products_path, notice: 'Produto atualizado com sucesso.'
		end
	end

	def destroy
		@item.destroy
		redirect_to products_path, notice: 'Produto excluído com sucesso.'
	end

	private
		def set_params
			@columns = ["ID", "name", "price", "description", "quantity"]
			@column_titles = ["id", "name", "price", "description", "quantity"]
			@title = 'produto'
		end

		def set_item
			@item = Product.find(params[:id])
		end

		def item_params
			params.require(:product).permit(:name, :price, :description, :quantity)
		end
end
