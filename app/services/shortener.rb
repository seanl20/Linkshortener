require "digest/sha2"

class Shortener
  attr_reader :url, :link_repo

  def initialize(url, link_repo = Repositories::LinkRepo.new)
    @url = url
    @link_repo = link_repo
  end

  def generate_short_link
    Links::Commands::Create.new.call(original_url: url, lookup_code: lookup_code)
  end

  def lookup_code
    loop do
      code = get_fresh_code
      break code unless link_repo.lookup_code_exists?(lookup_code: code)
    end
  end

  private

  def get_fresh_code
    SecureRandom.uuid[0..6]
  end
end
