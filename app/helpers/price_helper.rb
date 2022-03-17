# frozen_string_literal: true

module PriceHelper
  def price_change_text_class(change_direction)
    case change_direction
    when 'up'
      'text-success'
    when 'down'
      'text-danger'
    else
      'text-muted'
    end
  end
end
