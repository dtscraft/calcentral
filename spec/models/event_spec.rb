require 'spec_helper'

describe Event do
  it "has a valid factory" do
    Factory.create(:page).should be_valid
  end
  
end
