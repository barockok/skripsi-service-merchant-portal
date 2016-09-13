require 'sinatra'
require 'active_support/all'

require_relative 'lib/merchant_loader'
require_relative 'lib/merchant_service_handler'

get '/merchants/:id' do
  merchant = Merchant.find(params[:id])
  content_type :json
  merchant.to_json
end
