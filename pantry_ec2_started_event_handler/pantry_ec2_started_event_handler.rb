module Wonga
  module Daemon
    class PantryEc2StartedEventHandler
      def initialize(api_client, logger)
        @logger = logger
        @api_client = api_client
      end

      def handle_message(message)
        @logger.info "Returning started event for Request:#{message['pantry_request_id']}, Name:#{message['instance_name']}"
        message[:event] = :started
        @api_client.send_put_request("/api/ec2_instances/#{message['id']}", message)
      end
    end
  end
end
