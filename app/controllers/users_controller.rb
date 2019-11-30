class UsersController < ApplicationController
  protect_from_forgery with: :null_session
  # before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index new]


  # GET /users
  def index
    @users = User.all
    # render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    # render json: @user, status: :ok
  end

  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:alert] = "sucesso!"
      redirect_to root_path
    else
      flash[:alert] = "Erro ao criar o usuário!"
      render :new
    end
  end

  def edit
    #
  end

  def update
    if @user.update(user_params)
      flash[:alert] = "sucesso!"
      redirect_to root_path
    else
      flash[:alert] = "Erro ao atualizar usuário!"
      render :edit
    end
  end

  # DELETE /users/{username}
  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
        :name, :username, :email, :password, :password_confirmation
    )
  end
end
