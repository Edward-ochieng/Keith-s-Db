class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :transaction_type, :amount, :description, :user_id
end
