module MsgpackResponder
  module ActionController
    module Base

      def respond_with(resource, options = {})
        super(resource, options) do |format|
          format.mpac do
            render options.merge(mpac: resource)
          end
        end
      end

    end
  end
end
