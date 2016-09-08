class NotificationServiceHandler
  def send(url, transaction_body)
    puts "send notifaction to : #{url}"
    puts "body : #{transaction_body.id}"
    return "OK"
  end
end