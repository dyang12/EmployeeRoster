module SessionsHelper
  def current_employee=(employee)
    @current_employee = employee
    session[:session_token] = employee.session_token
  end
  
  def current_employee
    @current_employee || Employee.find_by_session_token(session[:session_token])
  end
  
  def logout_current_employee!
    current_employee.reset_session_token!
    session[:session_token] = nil
  end
  
  def require_current_employee!
    redirect_to new_session_url if current_employee.nil?
  end
  
  def require_admin_access!
    render :text => "Admin Access Only" unless current_employee.admin
  end
end
