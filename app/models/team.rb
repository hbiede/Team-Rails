class Team < ApplicationRecord
  has_and_belongs_to_many :employees, -> { order(name: :asc) }

  validates :name, length: { minimum: 1 }, uniqueness: true

  def name=(val)
    self.name = val.strip
  end
  def employees=(val)
    self.employees = val.uniq{|x| x.id}
  end

  def to_s
    "Team #{self.name}"
  end
end
