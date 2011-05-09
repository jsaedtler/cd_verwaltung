Given /^the following users:$/ do |users|
  User.create!(users.hashes)
end

Given /^I am logged in$/ do
  User.create!({
                 :login => 'quentin', 
                 :password => 'monkey', 
                 :password_confirmation => 'monkey', 
                 :email => 'monkey@example.com'
               })
  visit '/login'
  fill_in("login", :with => 'quentin')
  fill_in("password", :with => 'monkey')
  click_button('Log In')
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

Then /^it should log me in$/ do
  pending
end

Then /^I should see sorted users$/ do
  page.all(:xpath,'//td').map(&:text).should == User.all(:order => 'login asc').map(&:login)
end

