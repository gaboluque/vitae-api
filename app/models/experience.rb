# frozen_string_literal: true

class Experience < ApplicationRecord
  enum kind: { job: 0, education: 1, project: 2 }

  belongs_to :user
  has_one_attached :document
end
