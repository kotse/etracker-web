require 'spec_helper'

describe ExpensesController do

  describe "with logged in user" do
	login_user

    describe "GET 'index'" do
      it "returns http success" do
	    get 'index'
	    response.should be_success
	  end
	end
  end

  describe "without logged in user" do
    describe "GET 'index'" do
	  it "returns http redirect" do
	    get 'index'
	    response.should be_redirect
	  end
	end 
  end
end
