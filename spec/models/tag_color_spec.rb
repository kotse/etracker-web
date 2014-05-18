require 'spec_helper'

describe TagColor do
  before do
    @tag_color = FactoryGirl.create(:tag_color)
  end

  subject { @tag_color }
  
  it { should respond_to(:name) }
  it { should respond_to(:color_hex) }

  it { should be_valid }

  describe "when color_hex is not present" do
    before { @tag_color.color_hex = nil }

    it { should_not be_valid }
  end
end
