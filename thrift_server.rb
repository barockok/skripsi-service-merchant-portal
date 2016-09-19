
$:.push('xyz_thrift')
require 'thrift'
require 'active_support/all'
require 'merchant_service'
require_relative 'lib/merchant_loader'
require_relative 'lib/merchant_service_handler'

port = (ENV['PORT'] || 9092).to_i
handler = MerchantServiceHandler.new()
processor = XYZThrift::MerchantService::Processor.new(handler)
transport = Thrift::ServerSocket.new(port)
transportFactory = Thrift::BufferedTransportFactory.new()
server = Thrift::NonblockingServer.new(processor, transport, transportFactory)
puts "Thrift::NonblockingServer"
begin
  puts "Starting the server... on port #{port}"
  server.serve()
rescue Interrupt
  puts "done."
  exit(0)
end