module UsersHelper

  AG = [["2-4", 1], ["5-6", 2], ["7-10", 3],["11-15",4],["15-16",5]]

  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.firstname, class: "gravatar")
  end


end
