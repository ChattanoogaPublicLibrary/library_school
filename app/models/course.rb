class Course < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :user
  has_many :votes

  def user_has_voted?(user)
    Vote.where(:user_id => user.id, :course_id => id).count > 0
  end
end
