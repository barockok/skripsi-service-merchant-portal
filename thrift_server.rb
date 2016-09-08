
$:.push('xyz_thrift')
require 'thrift'
require 'merchant_service'
require File.expand_path("../config/environment", __FILE__)

handler = MerchantServiceHandler.new()
processor = XYZThrift::MerchantService::Processor.new(handler)
transport = Thrift::ServerSocket.new(9090)
transportFactory = Thrift::BufferedTransportFactory.new()
server = Thrift::SimpleServer.new(processor, transport, transportFactory)

begin
  puts "Starting the server..."
  server.serve()
rescue Interrupt
  puts "done."
  exit(0)
end