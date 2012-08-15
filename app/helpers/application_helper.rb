# -*- coding: utf-8 -*-
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

  def ag(x)
    case x
      when 1 then "(2-4)"
      when 2 then "(5-6)"
      when 3 then "(7-10)"
      when 4 then "(11-15)"
      when 5 then "(15-16)"
    end
  end

  def king(x)
    case x
      when false then "nein"
      when true then "ja"
    end
  end

  def intm(x)
    case x
      when 1 then "wöchentlich"
      when 2 then "14tägig"
      when 3 then "2x/Woche"
      when 4 then "täglich"
    end
  end

  def cat(x)
    case x
      when 1 then "Kindersport"
      when 2 then "Eltern-Kind-Sport"
      when 3 then "Kinderturnen"
      when 4 then "Turnen/Akrobatik"
      when 5 then "Artistik/Akrobatik"
      when 6 then "Badminton"
    end
  end

end
