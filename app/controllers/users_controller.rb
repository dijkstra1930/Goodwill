class UsersController < ApplicationController
  #before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @users }
      format.xml { render xml: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @products = @user.products.paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @users }
      format.xml { render xml: @users }
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Goodwill!"
      redirect_to @user

      respond_to do |format|
        format.html
        format.json { render json: @user, status: :created }
        format.xml { render xml: @user, status: :created }
      end
    else
      render 'new'

      respond_to do |format|
        format.html
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.xml { render xml: @user.errors, status: :unprocessable_entity }
      end
    end

  end

# PATCH/PUT /users/1
# PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user

      respond_to do |format|
        format.html
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      end

    else
      render 'edit'

      respond_to do |format|
        format.html
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.xml { render xml: @user.errors, status: :unprocessable_entity }
      end

    end


  end

# DELETE /users/1
# DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url

    respond_to do |format|
      if @user.destroy
        format.html
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.html
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.xml { render xml: @user.errors, status: :unprocessable_entity }
      end
    end

  end


  def check_email
    user = User.find_by_email(params[:email])

    if user==nil
      respond_to do |format|
        format.json  { render :json => { :status => true, :message => "Email available!"} }
      end
    else
      respond_to do |format|
        format.json  { render :json => { :status => false, :message => "Email is taken!"} }
      end
    end
  end

#private
#def signed_in_user
#  unless signed_in?
#    store_location
#    redirect_to signin_url, notice: "Please sign in."
#  end
#end
#
#def correct_user
#  @user = User.find(params[:id])
#  redirect_to(root_url) unless current_user?(@user)
#end
#
#def admin_user
#  redirect_to(root_url) unless current_user.admin?
#end


  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
