# frozen_string_literal: true

# Application policy
class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def admin
    @user.admin
  end

  def can_update
    @user.admin || @user.id == @record.user_id
  end
end
