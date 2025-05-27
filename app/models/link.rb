class Link < ApplicationRecord
  validates :original_url, presence: true
  validates :lookup_code, presence: true, uniqueness: { case_sensitive: false }
end
