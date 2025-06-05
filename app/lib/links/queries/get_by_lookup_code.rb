# frozen_string_literal: true

module Links
  module Queries
    class GetByLookupCode < Query
      Repositories::LinkRepo.new.get_by_lookup_code(lookup_code: params[:lookup_code])
    end
  end
end
