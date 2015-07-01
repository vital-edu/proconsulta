require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "Should not save without name_user, password_user, address_user, email_user" do
		user_first_test = User.new(:name => "teste", :password => "teste1234", :address => "teste", :email => "nil@nil.com")
		assert user_first_test.valid?
		#when every attribute isn't nil ,the password is higher than 6 chars and the email is in the correct regex, the user is true
		user_second_test = User.new(:name => nil, :password => "teste1234", :address => "teste", :email => "nil@nil.com")
		assert !user_second_test.valid?
		#now only the name is incorrect, but is enough to be false
		user_third_test = User.new(:name => "teste", :password => "teste", :address => "teste", :email => "nil@nil.com")
		assert !user_third_test.valid?
		#now the only thing that is wrong is the fact that the password is lower than 6 chars
		user_fourth_test = User.new(:name => "teste", :password => "teste1234", :address => nil, :email => "nil@nil.com")
		assert !user_fourth_test.valid?
		#only the adress isn't ok now, what is enough to be false
		user_fifth_test = User.new(:name => "teste", :password => "teste1234", :address => "teste", :email => "teste")
		assert !user_fifth_test.valid?
		#email with different regex
		user_sixth_test = User.new(:name => "a"*51, :password => "teste1234", :address => "teste", :email => "teste@teste.com")
		assert !user_sixth_test.valid?
		#name too long
		user_seventh_test = User.new(:name => "teste", :password => "teste1234", :address => "a"*100, :email => "teste@teste.com")
		assert !user_seventh_test.valid?
		#address too long
		user_8th_test = User.new(:name => "teste", :password => "teste1234", :address => "teste", :email => "a"*70+"@teste.com")
		assert !user_8th_test.valid?
		#email too long
		b = User.new(:name => "teste", :password => "teste1234", :address => "teste", :email => "nil@nil.com")
		c = User.new(:name => "teste", :password => "teste1234", :address => "teste", :email => "nil@nil.com")
		c.save
		assert c.valid?

	end
end
