require 'spec_helper'

describe Asset do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @asset = Asset.new asset_type: "Debit", description: "Default", amount: 1000, user_id: user.id
  end

  subject { @asset }

  it { should respond_to(:asset_type) }
  it { should respond_to(:description) }
  it { should respond_to(:amount) }
  it { should respond_to(:user_id) }
end