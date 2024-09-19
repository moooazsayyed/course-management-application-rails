class Student < ApplicationRecord
  validates :name, :year, presence: true
end
