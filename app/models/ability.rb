class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is_admin
      # admin can do anything
      can :manage, :all
    else
      # users can read everything
      can :read, :all
      # users can create posts and comments
      can :create, [Post, Comment]
      # users can edit their own posts and comments
      can :update, [Post, Comment], user: user
    end
  end
end
