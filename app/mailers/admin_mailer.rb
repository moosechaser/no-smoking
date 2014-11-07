class AdminMailer < ActionMailer::Base
  default to: "silviu.straliciuc@gmail.com"
  default from: "new.venue@funfarafum.com"

  def new_venue_email(email = "", venue)
    @email = email
    @venue = venue
    mail(subject: "A new venue needs admin approval")
  end
end
