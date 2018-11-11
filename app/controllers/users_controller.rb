class UsersController < TemplatesController
  private

  def model; @model = 'User'; end
  def title; @title = 'Usuário'; end

  def columns
    @columns = ["ID", "Nome", "Email", "Criado em", "Atualizado em"]
  end

  def column_titles
    @column_titles = ["id", "name", "email", "created_at", "updated_at"]
  end

  def permited_fields
		[:name, :email]
	end
end