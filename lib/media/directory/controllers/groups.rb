require_relative "base"

module Media
  module Directory
    module Controllers
      class Groups < Base

        set(:model)  { Models::Group }
        set(:policy) { Policies::Base }

        index
        show

        def parameters
          self.class.parameters.new(params, pattern: /[\w-]+/)
        end
      end
    end
  end
end
