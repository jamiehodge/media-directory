require_relative "base"

module Media
  module Directory
    module Controllers
      class People < Base

        set(:model)  { Models::People }
        set(:policy) { Policies::Base }

        index
        show
      end
    end
  end
end
