class EmployeesController < ApplicationController
  before_filter :require_current_employee!
  before_filter :require_admin_access!, :except => [:show, :index]
  
  def show
    @employee = Employee.find(params[:id])
    render :show
  end
  
  def index
    @employees = Employee.all
    render :index
  end
  
  def new
    @employee = Employee.new
    render :new
  end
  
  def create
    params[:employee][:manager_id] = current_employee.id
    @employee = Employee.new(params[:employee])
    if @employee.save
      redirect_to employee_url(@employee)
    else
      flash[:errors] = @employee.errors.full_messages
      render new_employee_url
    end
  end
  
  def edit
    @employee = Employee.find(params[:id])
    render :edit
  end
  
  def update
    @employee = Employee.find(params[:id])
    
    if @employee.update_attributes(params[:employee])
      render :show
    else
      flash[:errors] = @employee.errors.full_messages
      render edit_employee_url(@employee)
    end
  end
  
  def destroy
    Employee.find(params[:id]).destroy
    render :index
  end
end
