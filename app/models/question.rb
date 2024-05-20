class Question < ApplicationRecord
  belongs_to :g_form
  has_many :options, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  accepts_nested_attributes_for :options, allow_destroy: true
end
