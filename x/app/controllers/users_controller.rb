class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    if params[:remember] == "false" # Querystring
      cookies[:cruise_user] = nil
    elsif cookies[:cruise_user]
      if User.where(id: cookies[:cruise_user]).exists?
        redirect_to edit_user_path(User.find(cookies[:cruise_user]))
      end
    end
    @user_list = User.all.order(:id).to_a
    @user_list.unshift(User.new(name:"↓ Find your name!", id: -1))
    params[:remember_me] = true
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user_list = User.where("interest_level != 3 AND id != " + params[:id])
    @going = User.where(interest_level: 1).where.not(id: params[:id])
    @maybe = User.where(interest_level: 2).where.not(id: params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    user = User.find(params[:users][:name])
    if params[:remember_me] != nil
      cookies[:cruise_user] = {value: user.id, :expires => 1.year.from_now }
    end
    user.update!(interest_level: 2) if !user.is_user_updated
    redirect_to edit_user_path(user)
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params.merge({is_user_updated: true}))
      redirect_to edit_users_path(@user), notice: 'User was successfully updated.'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :num, :interest_level, :room_type_id, :room_id, :occupancy)
    end
end
