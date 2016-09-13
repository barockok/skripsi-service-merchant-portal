require 'csv'

module Merchant
  MERCHANT_LIST_FILE = File.expand_path('../../merchants.csv', __FILE__)
  ENTRIES = []
  extend self

  def load_merchant_data!
    content = File.read(MERCHANT_LIST_FILE).strip
    i = 0
    header = nil
    CSV.parse(content).each do |item|
      if i == 0
        header = item.map(&:strip)
      else
        ENTRIES << Hash[ header.zip(item) ].symbolize_keys
      end
      i += 1
    end
    return true
  end

  def find(merchant_id)
    sleep 2.0/1000
    ENTRIES.find{|merchant| merchant[:id] == merchant_id}
  end
end

Merchant.load_merchant_data!
