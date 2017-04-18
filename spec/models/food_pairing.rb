require 'rails_helper'

# Test suite for the Beer model
RSpec.describe FoodPairing, type: :model do
  
  # Verify is mongo document 
  it { is_expected.to be_mongoid_document }

  # Validate have timestamps
  it { is_expected.to have_timestamps }

  it { is_expected.to have_timestamps.for(:creating) }
  it { is_expected.to have_timestamps.for(:updating) }

  # Relation
   it { is_expected.to belong_to(:beer) }

  # Validation tests
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
end