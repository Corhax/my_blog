class Admin::SessionsController < Admin::BaseController
  layout 'admin/auth'
  skip_before_action :ensure_authenticated!, except: :destroy


  def new
    @admin = Admin.new
  end

  def create
    admin = Admin.find_by_email(admin_params[:email])
    if admin && admin.authenticate(admin_params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_root_path, notice: "Successfuly Login!"
    else
      @admin = Admin.new
      flash.now[:alert] = "There was error signing you in!"
      render "new"
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to root_path, notice: "Successfuly logout"
  end

  private
  def admin_params
    params.require(:admin).permit(:email, :password)
  end
end
