require "media/ldap"

module Media
  module Directory
    class Entry

      class << self
        attr_reader :directory

        def [](id)
          entry = directory[id]
          new(entry.to_h) if entry
        end

        def search(query)
          directory.search(query).map {|entry| new(entry.to_h) }
        end
      end

      attr_reader :id

      def initialize(params)
        @id = params.fetch(:id)
      end

      def to_h
        { id: id }
      end

      def to_json
        to_h.to_json
      end
    end
  end
end
