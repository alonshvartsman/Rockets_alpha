class SpaceshipPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    owner_or_admin?
  end

  def destroy?
    owner_or_admin?
  end

  def dashboard?
    true
  end

  private

  def owner_or_admin?
    user == record.user || user.admin
  end
end
