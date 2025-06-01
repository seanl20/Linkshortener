class Link < ApplicationRecord
  validates :original_url, presence: true
  validates :lookup_code, presence: true, uniqueness: { case_sensitive: false }
  validate :original_url_format

  def original_url_format
    uri = URI.parse(original_url || "")
    errors.add(:original_url, "Invalid URL format") if uri.host.nil?
  end
end
