class SessionsController < ApplicationController
  def new
    render :new
  end
  
  def create
    employee = Employee.find_by_email(params[:email])
    
    if employee.nil?
      flash[:errors] = ["Invalid Email"]
      redirect_to new_session_url
    else
      self.current_employee = employee
      redirect_to employee_url(employee)
    end
  end
  
  def destroy
    logout_current_employee
    render new_session_url
  end
end
