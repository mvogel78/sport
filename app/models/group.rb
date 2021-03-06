# -*- coding: utf-8 -*-
class Group < ActiveRecord::Base
  attr_accessible :user_id, :name, :starts_at, :ends_at, :agegroup, :kindergarden, :category, :duration, :intermittency

  belongs_to :user
  has_many :affiliations
  has_many :days
  has_many :appointments

  has_many :children, :through => :affiliations

  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }

  default_scope order: 'groups.starts_at DESC NULLS LAST'

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

  def termseries
    @dur =  (self.ends_at - self.starts_at).to_int / 7
    @apps = (1..@dur).collect { |x| self.starts_at + (7*x).days } 
  end

  def ingroup?(child)
    affiliations.find_by_child_id(child.id)
  end

end


