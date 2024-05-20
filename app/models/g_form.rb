class GForm < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  accepts_nested_attributes_for :questions, allow_destroy: true
end
