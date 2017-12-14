class Lesson < ApplicationRecord

  has_many :lessons_students
  has_and_belongs_to_many :students, through: :lessons_students
end
