require_relative "entry"

module Media
  module Directory
    module Models
      class Group < Entry
        attr_reader :name

        def initialize(params = {})
          super
          @name = params[:name]
        end

        class << self

          def directory
            @directory ||= Media::LDAP::Group
          end
        end
      end
    end
  end
end
