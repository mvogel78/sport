module ApplicationHelper
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
end
