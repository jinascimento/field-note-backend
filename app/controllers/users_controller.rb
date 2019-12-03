class UsersController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :find_user, except: %i[create index new]

  def index
    @users = User.all
  end

  def show
    #
  end

  def new
    @user = User.new
  end

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

  def destroy
    @user = Users::UserDestroyer.new(@user).call
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
