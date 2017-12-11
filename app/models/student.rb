class Student < ApplicationRecord

  after_update_commit :update_age

  def update_age
    return unless self.birthday
    dob = self.birthday || Time.now
    now = Time.now
    age = now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    self.update_columns(age: age)
  end
end
