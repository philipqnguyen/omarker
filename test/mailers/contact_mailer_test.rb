require 'test_helper'

# class ContactMailerTest < ActionMailer::TestCase
#   # test "the truth" do
#   #   assert true
#   # end
# end

describe 'Contact Mailer' do
  it 'should send email to proper address' do
    email = ContactMailer.create('supertaru@gmail.com', 'Philip Q Nguyen')

    email.must_deliver_to 'supertaru@gmail.com'
  end
end
