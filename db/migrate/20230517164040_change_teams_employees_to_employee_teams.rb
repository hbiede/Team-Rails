class ChangeTeamsEmployeesToEmployeeTeams < ActiveRecord::Migration[7.0]
  def change
    rename_table :teams_employees, :employees_teams
  end
end
