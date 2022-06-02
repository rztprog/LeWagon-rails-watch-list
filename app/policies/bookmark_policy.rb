class BookmarkPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def update?
    record.user == user
  end

  def create?
    true
    # Breach here ?
  end

  def destroy?
    record.user == user
  end
end
