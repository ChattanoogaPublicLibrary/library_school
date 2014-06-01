class Proposal < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  belongs_to :course

  def user_has_voted?(user)
    Vote.where(:user_id => user.id, :proposal_id => id).count > 0
  end
end
