Given /^the following users:$/ do |users|
  User.create!(users.hashes)
end

Then /^I should see the following users:$/ do |expected_users_table|
  expected_users_table.diff!(tableish('table tr', 'td,th'))
end

Then /^it should create a new user$/ do
  user = User.authenticate('new_login', 'new_password')
  user.should_not be_nil
  user.login.should == 'new_login'
  user.email.should == 'new@example.com'
end

