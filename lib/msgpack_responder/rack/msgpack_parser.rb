require 'msgpack'

module MsgpackResponder
  module Rack
    class MsgpackParser
      def initialize(app, options = {})
        @app = app
        @options = options
      end

      def call(env)
        post_params = ::Rack::Utils.parse_query(env['rack.input'].read, '&')
        get_params  = ::Rack::Utils.parse_query(env['QUERY_STRING'],    '&')

        if post_params.has_key? 'data'
          post_params.merge!(MessagePack.unpack(post_params['data']))
          post_params.delete('data')
        end

        if get_params.has_key? 'data'
          get_params.merge!(MessagePack.unpack(get_params['data']))
          get_params.delete('data')
        end

        env['rack.input']   = StringIO.new(::Rack::Utils.build_query(post_params))
        env['QUERY_STRING'] = ::Rack::Utils.build_query(get_params)

        @app.call(env)
      end
    end
  end
end
