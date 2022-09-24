# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def flash_class(type)
    case type
    when 'error', 'alert'
      'alert-danger'
    when 'notice'
      'alert-primary'
    when 'success'
      'alert-success'
    else
      type.to_s
    end
  end
end
