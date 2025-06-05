require 'rails_helper'

RSpec.describe "Link redirection", type: :request do
  let!(:link) { FactoryBot.create(:link, original_url: "https://www.youtube.com", lookup_code: "1234567") }

  it "redirects to the original URL for a given short link" do
    puts link.shortened_url
    get link.shortened_url
  end
end
