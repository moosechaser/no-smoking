class AdminMailer < ActionMailer::Base
  default to: "thomas.imorris@gmail.com"
  # default to: "silviu.straliciuc@gmail.com"

  default from: "new.venue@funfarafum.com"


  def feedback_email(input)
    @email = input[:email]
    @body = input[:body]

    mail(
      from:     "feedback@funfarafum.com",
      subject:  "Feedback received"
    )
  end


  def new_venue_email(email = "", venue)
    @email = email
    @venue = venue
    mail(subject: "A new venue needs admin approval")
  end
end
