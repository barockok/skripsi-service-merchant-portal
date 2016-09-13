require 'securerandom'
require 'active_support/all'
require 'faker'

$weight = (ENV['WEIGHT'] || 100).to_i
$target = ENV['TARGET'] || 'merchant'

def merchant_generator
  puts "id, name, website, industry, active, bank_mid, notification_url"
  $weight.times do |i|
    id                 = SecureRandom.uuid
    name               = Faker::Company.name
    website            = "http://" + Faker::Internet.domain_name
    industry           = Faker::Company.buzzword
    active             = true
    bank_mid           = SecureRandom.hex(4)
    notification_url   = Faker::Internet.url
    notification_email = Faker::Internet.email

    items              = [id, name, website, industry, active, bank_mid, notification_url]
    puts items.map(&:inspect).join(',')
  end
end

def customer_generator
  puts "customer_email,customer_name"
  $weight.times do |i|
    customer_email = Faker::Internet.free_email
    customer_name  = Faker::Name.name
    puts [customer_email,customer_name].map(&:inspect).join(',')
  end
end

if $target == 'customer'
  customer_generator
else
  merchant_generator
end
