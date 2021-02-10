json.extract! subscriber, :id, :email, :sub_email, :created_at, :updated_at
json.url subscriber_url(subscriber, format: :json)
