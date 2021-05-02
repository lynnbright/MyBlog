# frozen_string_literal: true

class Article < ApplicationRecord
  scope :recent, -> { order(created_at: :desc) }
  enum status: { draft: 0, publish: 1 }
end
