class OrdersController < TemplatesController
	def index
		@items = Order.left_outer_joins(:order_items).distinct.select('orders.*, SUM(order_items.price * order_items.quantity) AS total').group('orders.id')
		# @total = OrderItems.where(OrderItem.order_id = @items.id)
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
end
