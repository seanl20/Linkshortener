require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  let(:url) { "https://www.testurl.com" }

  it "can shorten a link provided by a user" do
    post :create, params: { format: 'json', link: { original_url: url } }

    link = assigns(:link)

    expect(link.original_url).to eq(url)
    expect(link.valid?).to be true
    expect(link.lookup_code.length).to eq(7)
    expect(response).to render_template('create')
  end
end
