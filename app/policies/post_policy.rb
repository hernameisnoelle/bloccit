class PostPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.present? && (user.role == 'admin' || user.role == 'moderator')
        scope.all 
      elsif user.present?
        scope.where(:user_id => @user.id)      
      else 
        []
      end
    end
  end
end


  
