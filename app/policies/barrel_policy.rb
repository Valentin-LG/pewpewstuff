class BarrelPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      p "in initialize ////////////////////////////"
      p scope
      byebug
      p "in initialize ////////////////////////////"
      @user = user
      @scope = scope
    end

    def resolve
      p "============================"
      p "in #{__FILE__ }->resolve?"
      p scope
      byebug
      p "============================"
      scope.all
    end

    private

    attr_reader :user, :scope
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end
end
