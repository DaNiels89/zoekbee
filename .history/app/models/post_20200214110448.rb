# frozen_string_literal: true

class Post < ApplicationRecord
  validates: :title, presence: true,
                     length: { minimum: 3 }
  belongs_to :user
  has_one_attached :pic
end
