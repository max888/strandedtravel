class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)

      if user.role?(:admin)
        can :manage, :all
      elsif user.role?(:registered)

        can :read, :all

        can :create, Activity

        can :create, Destination
        can :edit, Destination do |destination|
          destination.try(:user_id) == user.id 
        end

      else
        can :create, User
        can :read, Destination
        can :read, Activity
      end

  end
end
