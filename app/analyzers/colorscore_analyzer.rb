# frozen_string_literal: true

# Extracts image color information
class ColorscoreAnalyzer < ActiveStorage::Analyzer::ImageAnalyzer
  def metadata
    read_image do |image|
      data = {}
      data = data.merge(colors: image_colors(image.path))

      data = if rotated_image?(image)
               data.merge(width: image.height, height: image.width)
             else
               data.merge(width: image.width, height: image.height)
             end
      data
    end
  end

  private

  def image_colors(image_path, no_colors = 5)
    colorscores = Colorscore::Histogram.new(image_path).scores
    rgb_colors = colorscores.sort_by(&:first).reverse.take(no_colors).map(&:last)
    rgb_colors.map(&:hex).map { |hex| "##{hex}" }
  end
end
