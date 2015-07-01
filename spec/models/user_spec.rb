require 'rspec/its'
require 'spec_helper'
require 'rails_helper'

describe User do
	before do
		@user = FactoryGirl.create(:user)
	end

	subject { @user }
	it { should respond_to(:name) }
    it { should respond_to(:address) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
    it { should respond_to(:remember_token) }
    it { should respond_to(:authenticate) }

	it { should be_valid }

	describe "blank user_name" do
		before { @user.name = " " }
		it { should_not be_valid }
	end
	describe "blank email" do
		before { @user.email = " "}
		it { should_not be_valid}
	end
	describe "name_user too long " do
		before { @user.name = "a"*55 }
		it { should_not be_valid }
	end
	describe "invalid email format" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.
            foo@bar_baz.com foo@bar+baz.com]
      		addresses.each do |invalid_address|
      			@user.email = invalid_address
      			expect(@user).not_to be_valid
      		end
      	end
    end
    describe "password blank" do
    	before do
    		@user = User.new(name: "TesteUser",
    		 email: "teste@teste.com", password: " ",
    		 password_confirmation: " ")
    	end
    	it { should_not be_valid }
    end

    describe "password_confirmation isn't equal password" do
    	before do
    	 	@user = User.new(name: "testeuser",
    	 		email: "teste@teste.com", password: "teste1234",
    	 		password_confirmation: "blablabla1234")
     	end
    	it { should_not be_valid }
    end

    describe "remember token" do
        before { @user.save }
        its(:remember_token) { should_not be_blank }
    end
end