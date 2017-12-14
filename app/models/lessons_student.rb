class LessonsStudent < ActiveRecord::Base

  belongs_to :students
  belongs_to :lessons

end