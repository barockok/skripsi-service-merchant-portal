
$:.push('xyz_thrift')
require 'thrift'
require 'notification_service'
require File.expand_path("../config/environment", __FILE__)

handler = NotificationServiceHandler.new()
processor = XYZThrift::NotificationService::Processor.new(handler)
transport = Thrift::ServerSocket.new(9092)
transportFactory = Thrift::BufferedTransportFactory.new()
server = Thrift::SimpleServer.new(processor, transport, transportFactory)

begin
  puts "Starting the server..."
  server.serve()
rescue Interrupt
  puts "done."
  exit(0)
end