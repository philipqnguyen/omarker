require 'test_helper'

describe 'Authentication page' do
  it 'should allow visitors to sign up' do
    visit root_path
    click_on 'Sign in'
    click_on 'Sign up'

    fill_in 'Email', with: 'marty@mart.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'

    page.text.must_include 'signed up successfully'
    page.text.must_include 'Account'
    page.text.wont_include 'Sign in'
  end
  it 'should allow visitors to sign in as a user' do
    visit root_path
    click_on 'Sign in'

    fill_in 'Email', with: users(:user_1).email
    fill_in 'Password', with: 'password'
    click_on 'Log in'

    page.text.must_include 'Signed in successfully.'
    page.text.must_include 'Account'
    page.text.wont_include 'Sign in'
  end
  it 'should allow users to sign out' do
    sign_in

    click_on 'Sign out'

    page.text.must_include 'Signed out successfully'
  end
end
