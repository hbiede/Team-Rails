class Employee < ApplicationRecord
  has_and_belongs_to_many :teams, -> { order(name: :asc) }

  validates :name, presence: true

  def name=(val)
    self.name = val.strip
  end
  def teams=(val)
    self.teams = val.uniq{|x| x.id}
  end

  def to_s
    self.name
  end
end
