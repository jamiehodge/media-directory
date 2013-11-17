require "media/ldap"

module Media
  module Directory
    module Models
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

        attr_reader :id, :updated_at

        def initialize(params)
          @id         = params[:id]
          @updated_at = params[:updated_at]
        end

        def lock_version
          0
        end

        def to_json
          to_h.to_json
        end
      end
    end
  end
end
