module Repositories
  class LinkRepo
    def create(attrs:)
      Link.create!(attrs)
    end

    def lookup_code_exists?(lookup_code:)
      Link.exists?(lookup_code:)
    end
  end
end
