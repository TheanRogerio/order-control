class UsersController < ApplicationController
	before_action :set_item, only: [:edit, :update, :destroy, :show]
	before_action :set_params

	def index
		@items = User.select(:id, :name, :email, :created_at, :updated_at)
		render 'template/index'
	end

	def new
		@item = User.new
		render 'template/new'
	end

	def create
		@item = User.new(item_params)
		
		redirect_to users_path, notice: 'Usuário criado com sucesso.' if @item.save
	end

	def show
		render 'template/show'
	end

	def edit
		render 'template/edit'
	end
	
	def update
		if @item.update(item_params)
			redirect_to users_path, notice: 'Usuário atualizado com sucesso.'
		end
	end

	def destroy
		@item.destroy
		redirect_to users_path, notice: 'Usuário excluído com sucesso.'
	end

	private
		def set_params
			@columns = ["ID", "Nome", "Email", "Criado em", "Atualizado em"]
			@column_titles = ["id", "name", "email", "created_at", "updated_at"]
			@title = 'usuário'
		end

		def set_item
			@item = User.find(params[:id])
    end
    
    def item_params
      params.require(:user).permit(:name, :email)
    end
end
