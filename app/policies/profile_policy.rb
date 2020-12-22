# frozen_string_literal: true

# ProfilePolicy
class ProfilePolicy < ApplicationPolicy
  def update?
    can_update
  end

  def permitted_attributes_for_update
    %i[name phone location gender description avatar]
  end
end
