require "rails_helper"

RSpec.describe Shortener do
  let(:url_1) { "https://www.testurl.com" }
  let(:url_2) { "https://www.othertesturl.com" }

  it "shorten a given URL to a 7 character lookup code" do
    shortener = Shortener.new(url_1)

    expect(shortener.lookup_code.length).to eq(7)
  end

  it "gives each URL its own lookup code" do
    shortener_1 = Shortener.new(url_1)
    shortener_2 = Shortener.new(url_2)
    code_1 = shortener_1.lookup_code
    code_2 = shortener_2.lookup_code

    expect(code_2).not_to eq(code_1)
  end

  it "always give the same URL for the same lookup code" do
    shortener_1 = Shortener.new(url_1)
    shortener_2 = Shortener.new(url_1)
    code_1 = shortener_1.lookup_code
    code_2 = shortener_2.lookup_code

    expect(code_1).to eq(code_2)
  end

  it "generates a Link record with a unique lookup code" do
    shortener = Shortener.new(url_1)
    link = shortener.generate_short_link
    expect(link.valid?).to be true
    expect(link).to be_instance_of(Link)
  end
end
