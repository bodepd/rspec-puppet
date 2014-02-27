module RSpec::Puppet
  module TypeMatchers

    class CreateGeneric

      def initialize(*args, &block)
        @exp_default_provider = nil
        @exp_parameters = []
        @exp_properties = []
        # required parameters
        # required properties
        # autorequires
      end

      def with_default_provider(name)
        @exp_default_provider = @exp_default_provider | name
        self
      end

      def with_properties(props)
        @exp_properties = @exp_properties | Array(props)
        self
      end

      def with_parameters(params)
        @exp_parameters = @exp_parameters | Array(params)
        self
      end

      def matches?(resource)
        be_valid && match_default_provider && match_params && match_props
        false
      end

      def be_valid
        my_params = {}
        if self.respond_to?(:params)
          my_params = params
        end
        @resource = @type.new(
          my_params
        )
      end

      def match_default_provider
        @exp_provider || subject.defaultprovider == @exp_provider
      end

      def match_params
        true
      end

      def match_props
        true
      end

      def description
        "be a valid type"
      end

      def failure_message
        "Not a valid type #{@errors.inspect}"
      end

    end

  end
end
