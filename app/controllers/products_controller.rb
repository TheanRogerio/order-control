class ProductsController < TemplatesController
  private

  def model; @model = 'Product'; end
  def title; @title = 'produto'; end

  def columns
    @columns = ["ID", "name", "price", "description", "quantity"]
  end

  def column_titles
    @column_titles = ["id", "name", "price", "description", "quantity"]
  end

  def permited_fields
    [:name, :price, :description, :quantity]
  end
end