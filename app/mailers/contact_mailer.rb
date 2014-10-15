class ContactMailer < ActionMailer::Base
  default from: "supertaru@gmail.com"

  def contact_email(content)
    @subject = content[:subject]
    @body = content[:body]
    @name = content[:name]
    @email = content[:email]

    mail(to: 'nguyenp6@gmail.com', subject: 'Contact from Omarker user')
  end
end
