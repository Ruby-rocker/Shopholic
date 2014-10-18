class ApplicationController < ActionController::Base
  #protect_from_forgery
 before_filter :authenticate_user!, except: [:products_list]
 
 private
  def check_admin_role
    if current_user.role != false
       flash[:notice] = "You must be Admin to access this section"
      redirect_to root_path
    end
  end
end