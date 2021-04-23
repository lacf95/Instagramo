# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def linear_gradient(colors, direction = '')
    direction = direction.present? ? "#{direction}," : ''
    "linear-gradient(#{direction}#{colors.join(',')})"
  end

  def lazy_image_tag(source, options = {})
    options[:data] = {} unless options[:data]
    options[:data][:lazy_image] = url_for(source)
    image_tag('', options)
  end
end
