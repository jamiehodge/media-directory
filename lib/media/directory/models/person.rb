require_relative "entry"

module Media
  module Directory
    class Person < Entry

      attr_reader :name, :title, :organization,
        :department, :mail

      def initialize(attrs)
        super
        @name         = attrs[:name]
        @title        = attrs[:title]
        @organization = attrs[:organization]
        @department   = attrs[:department]
        @mail         = attrs[:mail]
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

      def to_h
        super.merge(
          name: name,
          title: title,
          organization: organization,
          department: department,
          mail: mail
        )
      end
    end
  end
end
