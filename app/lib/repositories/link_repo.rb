module Repositories
  class LinkRepo
    def create(attrs:)
      Link.create!(attrs)
    end

    def lookup_code_exists?(lookup_code:)
      Link.exists?(lookup_code:)
    end

    def get_by_lookup_code(lookup_code:)
      Link.find_by(lookup_code:)
    end
  end
end
