require 'spec_helper'

describe AssetPolicy do

  before do
    @user_loggedin = FactoryGirl.create(:user)
  end
  let(:asset) { FactoryGirl.create(:asset, user: @user_loggedin) }

  context "for the user owing the asset" do
    subject { AssetPolicy.new(@user_loggedin, asset) }

    it { should permit(:index)  }
    it { should permit(:create)  }
    it { should permit(:update)  }
    it { should permit(:destroy) }
  end

  context "for the user not owing the asset" do
    let(:user_loggedin) { FactoryGirl.create(:user) }

    subject { AssetPolicy.new(user_loggedin, asset) }

    it { should_not permit(:index)  }
    it { should_not permit(:create)  }
    it { should_not permit(:update)  }
    it { should_not permit(:destroy) }
  end
end