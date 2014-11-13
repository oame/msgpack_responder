require 'msgpack_responder/action_controller/base'
require 'msgpack_responder/rack/msgpack_parser'

module MsgpackResponder
  class Railtie < ::Rails::Railtie
    initializer 'msgpack_responder' do |app|
      ::ActionController.add_renderer :mpac do |obj, options|
        self.content_type = Mime::MPAC
        self.response_body = obj.respond_to?(:to_msgpack) ? obj.to_msgpack(options) : obj
      end

      app.middleware.use MsgpackResponder::Rack::MsgpackParser

      ActiveSupport.on_load(:action_controller) do
        include MsgpackResponder::ActionController::Base
      end
    end
  end
end
