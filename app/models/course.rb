class Course < ActiveRecord::Base
  has_many :proposals
  belongs_to :user
end
