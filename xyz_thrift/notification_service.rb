#
# Autogenerated by Thrift Compiler (0.9.3)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'xyz_types'

module XYZThrift
  module NotificationService
    class Client
      include ::Thrift::Client

      def send(url, transaction)
        send_send(url, transaction)
        return recv_send()
      end

      def send_send(url, transaction)
        send_message('send', Send_args, :url => url, :transaction => transaction)
      end

      def recv_send()
        result = receive_message(Send_result)
        return result.success unless result.success.nil?
        raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'send failed: unknown result')
      end

    end

    class Processor
      include ::Thrift::Processor

      def process_send(seqid, iprot, oprot)
        args = read_args(iprot, Send_args)
        result = Send_result.new()
        result.success = @handler.send(args.url, args.transaction)
        write_result(result, oprot, 'send', seqid)
      end

    end

    # HELPER FUNCTIONS AND STRUCTURES

    class Send_args
      include ::Thrift::Struct, ::Thrift::Struct_Union
      URL = 1
      TRANSACTION = 2

      FIELDS = {
        URL => {:type => ::Thrift::Types::STRING, :name => 'url'},
        TRANSACTION => {:type => ::Thrift::Types::STRUCT, :name => 'transaction', :class => ::XYZThrift::Transaction}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    class Send_result
      include ::Thrift::Struct, ::Thrift::Struct_Union
      SUCCESS = 0

      FIELDS = {
        SUCCESS => {:type => ::Thrift::Types::STRING, :name => 'success'}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

  end

end