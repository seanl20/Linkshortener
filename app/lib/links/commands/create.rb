# frozen_string_literal: true

module Links
  module Commands
    class Create < Command
      def call(original_url:, lookup_code:)
        attrs = Links::Changesets::Create.map({
          original_url:,
          lookup_code:
        })

        link = yield create_link(attrs:)

        Success(link:)
      end

      def create_link(attrs:)
        Success(Repositories::LinkRepo.new.create(attrs:))
      rescue ActiveRecord::RecordInvalid
        Failure(:invalid)
      end
    end
  end
end
