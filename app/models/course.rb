class Course < ActiveRecord::Base
  has_many :proposals
end
