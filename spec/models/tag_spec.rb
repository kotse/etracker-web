require 'spec_helper'

describe Tag do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @tag = FactoryGirl.create(:tag)
  end

  subject { @tag }
  
  it { should respond_to(:user_id) }
  it { should respond_to(:color) }
  it { should respond_to(:name) }
  it { should respond_to(:expenses) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @tag.user_id = nil }

    it { should_not be_valid }
  end

  describe "when name is not present" do
    before { @tag.name = nil }
    
    it { should_not be_valid }
  end

  it "has default color" do
    @tag.color.nil?.should be_false
  end
end

