require 'spec_helper'

describe User do

  before do
    @user = FactoryGirl.create(:user)
  end

  subject { @user }

  it { should respond_to (:assets) }
  it { should respond_to (:expenses) }
  it { should respond_to (:tags) }

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

  describe "expense association" do
    before do 
      @user.save
      @asset = FactoryGirl.create(:asset, user: @user)
    end

    let!(:first_expense) do
      FactoryGirl.create(:expense, user: @user, asset: @asset)
    end

    it "should delete expenses when user is destroyed" do
      expenses = @user.expenses.to_a
      @user.destroy
      # expenses is just a copy, we make the following expect to make sure to_a is not removed in some future
      expect(expenses).not_to be_empty

      expenses.each do |expense|
        expect(Expense.where(id: expense.id)).to be_empty
      end
    end
  end

  describe "tags association" do
    before do 
      @user.save
    end

    let!(:first_tag) do
      FactoryGirl.create(:tag, user: @user)
    end

    it "should delete tags when user is destroyed" do
      tags = @user.tags.to_a
      @user.destroy
      # tags is just a copy, we make the following expect to make sure to_a is not removed in some future
      expect(tags).not_to be_empty

      tags.each do |tag|
        expect(Tag.where(id: tag.id)).to be_empty
      end
    end
  end
end