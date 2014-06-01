class Vote < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :course
  belongs_to :user
end
