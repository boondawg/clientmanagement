json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :transaction_type, :amount, :consultation_id, :date, :payment_type
  json.url transaction_url(transaction, format: :json)
end
