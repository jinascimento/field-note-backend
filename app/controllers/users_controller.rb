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
    @user = Users::UserCreator.new(user_params).call
    flash[:alert] = "sucesso!"
    redirect_to root_path
  rescue => e
    flash[:alert] = "Erro ao criar o usuário!"
    render :new
  end

  def edit
    #
  end

  def update
    @user = Users::UserUpdater.new(@user, user_params).call
    flash[:alert] = "sucesso!"
    redirect_to root_path
  rescue => e
    flash[:alert] = "Erro ao atualizar usuário!"
    render :edit
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
