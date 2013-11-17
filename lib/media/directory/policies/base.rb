require "media/web"

module Media
  module Directory
    module Policies
      class Base < Web::Policies::Static

        def collection
          self.class.collection(person, item.class)
        end
      end
    end
  end
end
