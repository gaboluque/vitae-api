# frozen_string_literal: true

# Experience policy
class ExperiencePolicy < ApplicationPolicy
  def create?
    !admin
  end

  def update?
    user_current_entry
  end

  def destroy?
    user_current_entry
  end

  def permitted_attributes_for_create
    %i[kind place location title content start_month start_year end_month end_year ongoing document]
  end

  def permitted_attributes_for_update
    %i[id kind place location title content start_month start_year end_month end_year ongoing
       document]
  end

  private

  def user_current_entry
    @record.user_id == @user.id
  end
end
