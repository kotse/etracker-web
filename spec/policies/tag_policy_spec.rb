require 'spec_helper'

describe TagPolicy do

  before do
    @user_loggedin = FactoryGirl.create(:user)
  end
  let(:tag) { FactoryGirl.create(:tag, user: @user_loggedin) }

  context "for the user owing the tag" do
    subject { TagPolicy.new(@user_loggedin, tag) }

    it { should permit(:index)  }
    it { should permit(:create)  }
    it { should permit(:update)  }
    it { should permit(:destroy) }
  end

  context "for the user not owing the tag" do
    let(:user_loggedin) { FactoryGirl.create(:user) }

    subject { TagPolicy.new(user_loggedin, tag) }

    it { should_not permit(:index)  }
    it { should_not permit(:create)  }
    it { should_not permit(:update)  }
    it { should_not permit(:destroy) }
  end
end