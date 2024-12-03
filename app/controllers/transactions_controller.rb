class TransactionsController < ApplicationController
  # Skip CSRF verification for API actions
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Use `dup` on parameters to avoid modifying frozen objects
    transaction = Transaction.create!(transaction_params.dup)

    if transaction.persisted?
      # Render JSON response without modifying frozen serialization context
      render json: transaction, status: :created
    else
      render json: { errors: transaction.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  # Strong parameters to ensure only allowed fields are passed
  def transaction_params
    # Avoid reserved `type` column by renaming it in your schema to `transaction_type`
    params.permit(:user_id, :amount, :transaction_type, :description)
  end
end

