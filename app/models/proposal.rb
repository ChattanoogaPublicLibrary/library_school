class Proposal < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_many :courses

  def self.sort_by_votes
    order('votes_count DESC')
  end

  def user_has_voted?(user)
    Vote.where(:user_id => user.id, :proposal_id => id).count > 0
  end
end
