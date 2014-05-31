class Proposal < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  belongs_to :course
end
