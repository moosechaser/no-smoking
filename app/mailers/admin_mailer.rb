class AdminMailer < ActionMailer::Base
  default to: "silviu.straliciuc@gmail.com"
  default from: "new.venue@funfarafum.com"

  def new_venue_email(email = "", venue_name, latitude, longitude, link,
                      address, venue_type, smoking_policy, description)

    @email = email
    @venue_name = venue_name  
    @latitude = latitude 
    @longitude = longitude 
    @link = link 
    @address = address 
    @venue_type = venue_type 
    @smoking_policy = smoking_policy
    @description = description
    mail(subject: "A new venue needs admin approval")
  end
end
