require_relative "base"

module Media
  module Directory
    module Controllers
      class Groups < Base

        set(:model)  { Models::Group }
        set(:policy) { Policies::Base }

        index
        show
      end
    end
  end
end
