# frozen_string_literal: true

# Profile model
class Profile < ApplicationRecord
  enum gender: { male: 0, female: 1 }

  belongs_to :user
  has_one_attached :avatar

  def birth_date
    return unless self[:birth_date]

    self[:birth_date].strftime('%d/%m/%Y')
  end

  def age
    return unless self[:birth_date]

    ((Time.zone.now - self[:birth_date]) / 1.year.seconds).floor
  end
end
