require_relative "entry"

module Media
  module Directory
    class Group < Entry
      attr_reader :name

      def initialize(attrs)
        super
        @name = attrs[:name]
      end

      class << self

        def directory
          @directory ||= Media::LDAP::Group
        end
      end

      def to_h
        super.merge(name: name)
      end
    end
  end
end
