require 'rails_helper'

RSpec.describe Link, type: :model do
  it { is_expected.to validate_presence_of(:original_url) }
  it { is_expected.to validate_presence_of(:lookup_code) }
  it { is_expected.to validate_uniqueness_of(:lookup_code).case_insensitive }
end
