class MailersController < ApplicationController
  def contact
    ContactMailer.contact_email({ subject: params[:subject],
                           body:    params[:body],
                           name:    params[:name],
                           email:   params[:email] }).deliver
    redirect_to about_path
  end
end
