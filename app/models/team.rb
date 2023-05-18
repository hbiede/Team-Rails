class Team < ApplicationRecord
  has_and_belongs_to_many :employees, -> { order(name: :asc) }

  validates :name, length: { minimum: 1 }, uniqueness: true

  before_save do
    self.name = name.strip
  end
  before_validation do
    self.name = name.strip
  end

  def to_s
    "Team #{self.name}"
  end
end
