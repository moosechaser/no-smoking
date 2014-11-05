class AdminMailer < ActionMailer::Base
  default to: "thomas.imorris@gmail.com"
  default from: "new.venue@funfarafum.com"

  def new_venue_email(venue_name, latitude, longitude, link, address,
                      venue_type, smoking_policy)

    @venue_name = venue_name  
    @latitude = latitude 
    @longitude = longitude 
    @link = link 
    @address = address 
    @venue_type = venue_type 
    @smoking_policy = smoking_policy

    mail(subject: "A new venue needs admin approval")
  end
end
