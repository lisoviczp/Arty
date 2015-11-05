class ArtistMailer < ActionMailer::Base
  default from: 'artery@example.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    # mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    mail(to: "phillip.lisovicz@gmail.com", subject: 'Welcome to Artery!')
  end

  def commission_notify_email(artist)
    @artist = artist
    @url  = 'http://example.com/login'
    # mail(to: @artist.email, subject: "You've been commissioned!")
    mail(to: "phillip.lisovicz@gmail.com", subject: "You've been commissioned!")
  end
end
