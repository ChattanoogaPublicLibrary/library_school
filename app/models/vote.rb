class Vote < ActiveRecord::Base
  belongs_to :proposal, :counter_cache => true
  belongs_to :course, :counter_cache => true
  belongs_to :user
end
