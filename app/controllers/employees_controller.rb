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
      render :new
    end
  end
  
  def edit
    @employee = Employee.find(params[:id])
    render :edit
  end
  
  def update
    @employee = Employee.find(params[:id])
    
    if @employee.update_attributes(params[:employee])
      redirect_to :show
    else
      flash[:errors] = @employee.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    Employee.find(params[:id]).destroy
    redirect_to employees_url
  end
end
