class MerchantServiceHandler
  def get(merchant_id)
    puts "MerchantServiceHandler#get : #{merchant_id}"
    merchant = Merchant.where(id: merchant_id).first
    raise XYZThrift::MerchantNotFound.new("cannot find merchant with id #{merchant_id}") if !merchant
    merchant_struct = XYZThrift::Merchant.new
    merchant.as_json(except: [:created_at, :updated_at, :industry, :notification_email]).each do |key, val|
      merchant_struct.send("#{key}=", val)
    end
    return merchant_struct
  end
end