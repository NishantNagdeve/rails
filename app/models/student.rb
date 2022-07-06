class Student < ApplicationRecord
  validates :name, :email, :roll_no, :school, presence: true
end
