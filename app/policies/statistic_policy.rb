class StatisticPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show
    true
  end

  def update?
    record.user == current_user
  end

  def create?
    # Any logged in user can create a statistic
    !user.nil?
  end
end
