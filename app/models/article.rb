# frozen_string_literal: true

class Article < ApplicationRecord
  enum status: { draft: 0, publish: 1 }
end
