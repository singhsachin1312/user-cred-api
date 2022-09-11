class Api::UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    users = User.paginate(page: params[:page], per_page: 3)
    render json: {status: 200, users: users}
  end

  def create
    user = User.create(user_params)
    render json: {status: :created, message: "User created sucessfully", user: user}
  end

  def show
    render json: {status: 200, user: @user}
  end

  def update
    @user.update(user_params)
    render json: {status: 200, message: "User updated sucessfully", user: @user}
  end

  def destroy
    @user.destroy
    render json: {status: 200, message: "User deleted sucessfully" }
  end

  def typeahead
    users = User.where(
            "lower(first_name) LIKE ? OR lower(last_name) LIKE ? OR lower(email) LIKE ?",
            "%#{params[:input]}%", "%#{params[:input]}%", "%#{params[:input]}%"
            )
    render json: {status: 200, users: users}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_id(params[:id])
      unless @user.present?
        render json: {success: false, message: 'Not Found!'}
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
end
