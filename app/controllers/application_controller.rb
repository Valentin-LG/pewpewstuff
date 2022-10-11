# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit::Authorization

  rescue_from ActiveRecord::RecordNotFound, with: :not_found_error
  rescue_from Pundit::NotDefinedError, with: :not_found_error
  # rescue_from Pundit::AuthorizationNotPerformedError, with: :user_not_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def not_found_error
    render json: 'record not found', status: :not_found
  end
end
