module ApplicationHelper


  AG = [["2-4", 1], ["5-6", 2], ["7-10", 3],["11-15",4],["15-16",5]]

  def title
    base_title = "Projekt Entwurf"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{ @title }"
    end
  end


  def full_title(page_title)
    base_title = "Projekt Entwurf"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def usrlist 
    User.all.map { |user| [user.lastname, user.id] } 
  end

end
