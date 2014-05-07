require 'spec_helper'

describe "Expense pages" do

  describe "view expense page" do
	let(:user) { FactoryGirl.create(:user) }
    let(:asset) { FactoryGirl.create(:asset, user: user, description: "Main Debit") }
    let!(:expense) { FactoryGirl.create(:expense, user: user, asset: asset, amount: 100) }

	before do
		login_as user
		visit expenses_path
	end

	subject { page }

	it { should have_content "Your expenses" }
	it { should have_content "Main Debit" }
	it { should have_content "100" }
  end
end