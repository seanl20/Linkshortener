require "rails_helper"

RSpec.describe Repositories::LinkRepo do
  describe "#create" do
    subject(:create) { described_class.new.create(attrs:) }

    context "when valid attrs are passed" do
      let(:attrs) do
        {
          original_url: "https://www.testurl.com",
          lookup_code: "1234567"
        }
      end

      it "create link" do
        expect { create }.to change { Link.count }.by(1)
      end
    end

    context "when a look up code already exists" do
      let!(:link) { FactoryBot.create(:link, original_url: "https://www.testurl.com", lookup_code: "1234567") }
      let(:attrs) do
        {
          original_url: "https://www.testurl.com",
          lookup_code: "1234567"
        }
      end

      it "create link" do
        expect { create }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end


    context "when invalid attrs are passed" do
      context "when there is no lookup code passed" do
        let(:attrs) do
          {
            original_url: "https://www.testurl.com"
          }
        end

        it "raise Record invalid" do
          expect { create }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

      context "when there is no original url passed" do
        let(:attrs) do
          {
            lookup_code: "123456"
          }
        end

        it "raise Record invalid" do
          expect { create }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

      context "when there is no attrs are passed" do
        let(:attrs) do
          {}
        end

        it "raise Record invalid" do
          expect { create }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end
  end

  describe "#lookup_code_exists?" do
    subject(:lookup_code_exists?) { described_class.new.lookup_code_exists?(lookup_code:) }

    context "when lookup code exists" do
      let!(:link) { FactoryBot.create(:link, original_url: "https://www.testurl.com", lookup_code: "1234567") }
      let(:lookup_code) { "1234567" }

      it "returns true" do
        expect(lookup_code_exists?).to be true
      end
    end

    context "when lookup code does not exists" do
      let(:lookup_code) { "1234567" }

      it "returns false" do
        expect(lookup_code_exists?).to be false
      end
    end
  end

  describe "#get_by_lookup_code" do
    subject(:get_by_lookup_code) { described_class.new.get_by_lookup_code(lookup_code:) }

    context "lookup code exists" do
      let!(:link) { FactoryBot.create(:link, original_url: "https://www.testurl.com", lookup_code: "1234567") }
      let(:lookup_code) { "1234567" }

      it "returns link" do
        expect(get_by_lookup_code).to eq(link)
      end
    end

    context "lookup code doesn't exists" do
      let(:lookup_code) { "1234567" }
      it "return empty" do
        expect(get_by_lookup_code).to eq(nil)
      end
    end
  end
end
