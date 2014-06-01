class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :courses
  has_many :proposals

  def admin?
    admin
  end

  def enrolled_courses
    Course.joins(:votes).where(:user_id => id)
  end
end
