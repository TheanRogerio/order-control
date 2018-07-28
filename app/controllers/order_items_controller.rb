class OrderItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]
  before_action :set_params, exception: [:edit]
  before_action :set_order, only: [:index, :new, :create, :edit, :update,
                :destroy]

  def index
    @items = OrderItem.where(order_id: @order.id)
  end
  
  def new
    @item = OrderItem.new
    @title = 'item'
    render 'template/new'
  end
  
  def create
    @item = OrderItem.new(item_params)

    if @item.save
      redirect_to order_order_items_path,
        notice: 'Item adicionado ao pedido com sucesso.'
    end
  end

  def edit
    @title = 'item do pedido'
    render 'template/edit'
  end
  
  def update
    if @item.update(item_params)
      redirect_to order_order_items_path(@order, @item),
                  notice: 'Pedido atualizado com sucesso.'
		end
  end

  def destroy
		@item.destroy
		redirect_to order_order_items_path, notice: 'Item excluído com sucesso.'
	end

  private
  def set_params
    @columns = ["ID", "Descrição", "Qtd", "Preço", "Pedido", "Criado em",
                "Atualizado em"]
    @column_titles = ["id", "description", "quantity", "price", "order_id",
                      "created_at", "updated_at"]
    @title = 'itens do pedido'
  end

  def set_item
    @item = OrderItem.find(params[:id])
  end

  def set_order
    @order = Order.find(params[:order_id])
  end

  def item_params
    params.require(:order_item)
          .permit(:description, :quantity, :price, :order_id)
  end
end