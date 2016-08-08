json.extract! merchant, :id, :name, :website, :industry, :active, :bank_mid, :notification_url, :notification_email, :created_at, :updated_at
json.url merchant_url(merchant, format: :json)