class ContactController < ApplicationController

  def feedback
  end

  def send_feedback_email
    feedback_params
    AdminMailer.feedback_email(feedback_params).deliver

    redirect_to venues_path, notice: "Thanks for your feedback, we really appreciate it!"
  end


  def send_new_venue_email
    received_params = email_params
    venue = Venue.new(venue_params)
    AdminMailer.new_venue_email(received_params[:email], venue).deliver

    redirect_to venues_path, notice: "Your venue has been submitted.  It will be posted after it is approved by an admin. Thanks!"
  end

  private
    def email_params
      params.permit(:email)
    end

    def venue_params
      params.permit(:name, :latitude, :longitude, :link, :address,
                    :venue_type, :smoking_policy, :description)
    end

    def feedback_params
      params.permit(:email, :body)
    end
end
