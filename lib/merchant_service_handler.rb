class MerchantServiceHandler
  def get(merchant_id)
    puts "MerchantServiceHandler#get : #{merchant_id}"
    merchant = Merchant.find(merchant_id)
    raise XYZThrift::MerchantNotFound.new("cannot find merchant with id #{merchant_id}") if !merchant
    merchant_struct = XYZThrift::Merchant.new
    merchant.each do |key, val|
      merchant_struct.send("#{key}=", val)
    end
    return merchant_struct
  end
end