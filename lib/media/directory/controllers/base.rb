require "media/web"

module Media
  module Directory
    module Controllers
      class Base < Web::Controllers::Base
        set(:root) { File.expand_path("../../", __FILE__) }

        def collection
          super.search(parameters.query)
        end
      end
    end
  end
end
