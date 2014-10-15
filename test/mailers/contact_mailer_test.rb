require 'test_helper'

# class ContactMailerTest < ActionMailer::TestCase
#   # test "the truth" do
#   #   assert true
#   # end
# end

describe 'Contact Mailer' do
  it 'should send email to proper address' do
    email = ContactMailer.contact_email({ subject: 'test',
                                          body:    'test',
                                          name:    'testuser',
                                          email:   'test@email.com' })

    email.must_deliver_to 'nguyenp6@gmail.com'
  end
end
