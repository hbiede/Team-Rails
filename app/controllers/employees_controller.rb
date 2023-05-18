class EmployeesController < ApplicationController
  def index
    # TODO: Paginate with find_in_batches
    @employees = Employee.select('name', 'id')
  end

  def new
    @employee = Employee.new
    @teams = Team.all.order 'name'
  end

  def create
    @employee = Employee.create(
      name: params[:employee][:name],
      teams: Team.find(params[:employee][:teams].reject(&:empty?).map(&:to_i))
    )

    if @employee.valid? && @employee.save
      redirect_to @employee
    end
  end

  def show
    @employee = Employee.select('name', 'id').find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    @teams = Team.all.order 'name'
  end
end
