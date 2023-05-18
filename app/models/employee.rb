class Employee < ApplicationRecord
  has_and_belongs_to_many :teams, -> { order(name: :asc) }

  validates :name, presence: true

  before_save do
    self.name = name.strip
  end
  before_validation do
    self.name = name.strip
  end

  def to_s
    self.name
  end
end
