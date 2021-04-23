# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true

  def standard_image
    height = image.metadata[:height].to_i
    width = image.metadata[:width].to_i
    size = height > width ? width : height
    image.variant(gravity: 'center', extent: "#{size}x#{size}", resize_to_limit: [400, 400])
  end

  def big_image
    height = image.metadata[:height].to_i
    width = image.metadata[:width].to_i
    size = height > width ? width : height
    image.variant(gravity: 'center', extent: "#{size}x#{size}", resize_to_limit: [1000, 1000])
  end
end
