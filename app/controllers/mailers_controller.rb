class MailersController < ApplicationController
  def contact
    ContactMailer.delay.contact_email(subject: params[:subject],
                                      body:    params[:body],
                                      name:    params[:name],
                                      email:   params[:email])
    redirect_to about_path
  end
end
