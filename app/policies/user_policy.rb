# frozen_string_literal: true

# User Policy
class UserPolicy < ApplicationPolicy
  def show?
    admin
  end

  def update?
    admin
  end

  def destroy?
    admin
  end

  def index?
    admin
  end

  def permitted_attributes_for_create
    [:email, :password, :password_confirmation, :admin, {
      profile_attributes: %i[name phone location gender description birth_date avatar]
    }]
  end

  def permitted_attributes_for_update
    [:email, :password, :password_confirmation, :admin, {
      profile_attributes: %i[name phone location gender description birth_date avatar]
    }]
  end
end
