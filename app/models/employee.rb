class Employee < ApplicationRecord
  has_and_belongs_to_many :teams, -> { order(name: :asc) }

  validates :name, presence: true

  def to_s
    self.name
  end
end
