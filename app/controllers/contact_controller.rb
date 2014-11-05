class ContactController < ApplicationController
  def send_new_venue_email
    received_params = email_params

    email =           received_params[:email]
    name =            received_params[:name]
    latitude =        received_params[:latitude]
    longitude =       received_params[:longitude]
    link =            received_params[:link]
    address =         received_params[:address]
    venue_type =      received_params[:venue_type]
    smoking_policy =  received_params[:smoking_policy]

    AdminMailer.new_venue_email(email, name, latitude, longitude, link,
                                address, venue_type,
                                smoking_policy).deliver

    redirect_to venues_path, notice: "Your venue has been submitted.  It will be posted after it is approved by an admin. Thanks!"
  end

  private
    def email_params
      params.permit(:email, :name, :latitude, :longitude, :link, :address,
                    :venue_type, :smoking_policy)
    end
end
