require_relative "entry"

module Media
  module Directory
    module Models
      class Person < Entry

        attr_reader :name, :description, :department,
          :room, :telephone, :mail

        def initialize(params = {})
          super
          @name        = params[:name]
          @description = params[:description]
          @department  = params[:department]
          @room        = params[:room]
          @telephone   = params[:telephone]
          @mail        = params[:mail]
        end

        class << self

          def authenticate(id, password)
            entry = directory.authenticate(id, password)
            new(entry.to_h) if entry
          end

          def directory
            @directory ||= Media::LDAP::Person
          end
        end
      end
    end
  end
end
