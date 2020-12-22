# frozen_string_literal: true

# User model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :experiences, dependent: :delete_all

  def jwt_payload
    { iss: 'CV' }
  end
end
