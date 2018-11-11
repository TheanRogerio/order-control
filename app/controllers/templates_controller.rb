class TemplatesController < ApplicationController
	before_action :title, :columns, :column_titles, only: [:index, :edit]

	def index
		@items = eval(model).all
	end

	def new
		@item = eval(model).new
	end

	def create
		@item = eval(model).new(item_params)
    
    if @item.save
      flash[:notice] = "#{title.capitalize} criado com sucesso."
      redirect_to eval("#{@model.pluralize.downcase}_path")
    end
	end

	def edit; item; end
	
	def update
		if item.update(item_params)
			flash[:notice] = "#{title.capitalize} atualizado com sucesso."
      redirect_to eval("#{model.pluralize.downcase}_path")
		end
	end

	def destroy
		item.destroy
		flash[:notice] = "#{title.capitalize} excluído com sucesso."
		redirect_to eval("#{@model.pluralize.downcase}_path")
	end

	private

	def model; @model = 'Order'; end
  def title; @title = 'Pedido'; end

  def columns
		@columns = ["Nº do pedido", "Status", "Valor total", "Usuário"]
  end
	
  def column_titles
		@column_titles = ["id", "status", "total", "user_id"]
  end

  def permited_fields
		[:status, :user_id]
	end
	
	def item
		@item = eval(model).find(params[:id])
	end
	
	def item_params
		params.require(eval(":#{model.downcase}")).permit(permited_fields)
	end
	
	def permited_fields; []; end

	def model; @model = ''; end

  def title; @title = ''; end
	
	def columns; @columns = []; end
	
	def column_titles; @column_titles = []; end
end
