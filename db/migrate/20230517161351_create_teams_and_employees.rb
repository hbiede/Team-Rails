class CreateTeamsAndEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name

      t.timestamps
    end

    create_table :employees do |t|
      t.string :name

      t.timestamps
    end

    create_table :employees_teams do |t|
      t.belongs_to :team
      t.belongs_to :employee
    end
  end
end
