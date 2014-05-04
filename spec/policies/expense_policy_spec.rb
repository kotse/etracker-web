require 'spec_helper'

describe ExpensePolicy do

  before do
    @user_loggedin = FactoryGirl.create(:user)
  end
  let(:expense) { FactoryGirl.create(:expense, user: @user_loggedin) }

  context "for the user owing the expense" do
    subject { ExpensePolicy.new(@user_loggedin, expense) }

    it { should permit(:index)  }
    it { should permit(:create)  }
    it { should permit(:update)  }
    it { should permit(:destroy) }
  end

  context "for the user not owing the expense" do
    let(:user_loggedin) { FactoryGirl.create(:user) }

    subject { ExpensePolicy.new(user_loggedin, expense) }

    it { should_not permit(:index)  }
    it { should_not permit(:create)  }
    it { should_not permit(:update)  }
    it { should_not permit(:destroy) }
  end
end