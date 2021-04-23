# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  helper_method :current_user

  def current_user
    return unless cookies.encrypted[:user_id]

    @current_user ||= User.find(cookies.encrypted[:user_id])
  end
end
