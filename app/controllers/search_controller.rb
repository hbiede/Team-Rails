class SearchController < ApplicationController
  def search
    @teams = Team.where('instr(lower(name), lower(?)) > 0', Team.sanitize_sql(params[:term]))
    @employees = Employee.where('instr(lower(name), lower(?)) > 0', Employee.sanitize_sql(params[:term]))
  end
end
