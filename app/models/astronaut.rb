class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job
  # belongs_to :mission
  has_many :missions
  has_many :astronaut_missions

end
