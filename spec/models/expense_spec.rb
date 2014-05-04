require 'spec_helper'

describe Expense do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @expense = FactoryGirl.create(:expense)
  end

  subject { @expense }
  
  it { should respond_to(:user_id) }
  it { should respond_to(:asset_id) }
  it { should respond_to(:description) }
  it { should respond_to(:amount) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @expense.user_id = nil }

    it { should_not be_valid }
  end

  describe "when asset_id is not present" do
    before { @expense.asset_id = nil }
    
    it { should_not be_valid }
  end

  describe "when amount is not present" do
    before { @expense.amount = nil }
    
    it { should_not be_valid }
  end
end

