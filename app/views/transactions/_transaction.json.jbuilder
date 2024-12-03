json.extract! transaction, :id, :user_id, :amount, :description, :type, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
