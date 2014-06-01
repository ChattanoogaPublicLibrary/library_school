class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.admin?
        can :access, :rails_admin
        can :dashboard
        can :manage, :all
      else
        can :read, :all
        can :create, Vote
        can :create, Proposal
        can :create, Course
        can :vote, Proposal
        can :vote, Course
        can :manage, User, :id => user.id
        can :manage, Proposal, :user_id => user.id
        can :manage, Course, :user_id => user.id
      end
    else
      can :read, :all
      can :create, User
    end

  end
end
