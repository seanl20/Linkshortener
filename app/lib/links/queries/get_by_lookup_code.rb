# frozen_string_literal: true

module Links
  module Queries
    class GetByLookupCode < Query
      def call(lookup_code:)
        Repositories::LinkRepo.new.get_by_lookup_code(lookup_code:)
      end
    end
  end
end
