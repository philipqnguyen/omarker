class ContactMailer < ActionMailer::Base
  default from: "contact@omarker.herokuapp.com"

  def contact_email(content)
    @subject = content[:subject]
    @body = content[:body]
    @name = content[:name]
    @email = content[:email]

    mail(to: Rails.application.secrets.target_email,
         subject: 'Contact from Omarker user')
  end
end
