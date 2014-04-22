require 'spec_helper'

describe Asset do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @asset = FactoryGirl.create(:asset)
  end

  subject { @asset }

  it { should respond_to(:asset_type) }
  it { should respond_to(:description) }
  it { should respond_to(:amount) }
  it { should respond_to(:user_id) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @asset.user_id = nil }

    it { should_not be_valid }
  end

  describe "when asset_type is not present" do
    before { @asset.asset_type = nil }
    
    it { should_not be_valid }
  end

  describe "when amount is not present" do
    before { @asset.amount = nil }
    
    it { should_not be_valid }
  end
end