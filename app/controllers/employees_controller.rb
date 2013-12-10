class EmployeesController < ApplicationController
  
  def show
    @employee = Employee.find(params[:id])
    render :show
  end
  
  def index
    @employees = Employee.all
    render :json => @employees
  end
  
  def new
    render :new
  end
  
  def create
    @employee = Employee.new(params[:employee])
    if @employee.save
      redirect_to employee_url(@employee)
    else
      flash[:errors] = @employee.errors.full_messages
      render new_employee_url
    end
  end
  
  def edit
    render :edit
  end
  
  def update
    
  end
  
  def destroy
    
  end
end
