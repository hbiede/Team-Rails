class TeamsController < ApplicationController
  def index
    @teams = Team.select('name', 'id')
  end

  def new
    @employees = Employee.all.order 'name'
    @team = Team.new
  end

  def create
    @team = Team.create(
      name: params[:team][:name].gsub(/^Team\s+/, ''),
      employees: Employee.find(params[:team][:employees].reject(&:empty?).map(&:to_i))
    )

    if @team.valid? && @team.save
      redirect_to @team
    end
  end

  def show
    @team = Team.select('name', 'id').find(params[:id])
  end

  def update
    @employee = Employee.all.order 'name'
    @teams = Team.find(params[:id])

    if @team.update(team_params)
      redirect_to @team
    else
      render :update, status: :unprocessable_entity
    end
  end
end
