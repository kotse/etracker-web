require 'spec_helper'

describe User do

  before do
    @user = FactoryGirl.create(:user)
  end

  subject { @user }

  it { should respond_to (:assets) }

  describe "asset association" do

  	before { @user.save }
    let!(:first_asset) do
      FactoryGirl.create(:asset, user: @user)
    end

  	it "should delete assets when user is destroyed" do
  		assets = @user.assets.to_a
  		@user.destroy
  		# assets is just a copy, we make the following expect to make sure to_a is not removed in some future
  		expect(assets).not_to be_empty

  		assets.each do |asset|
  			expect(Asset.where(id: asset.id)).to be_empty
		end
  	end
  end
end