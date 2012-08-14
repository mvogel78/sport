class Child < ActiveRecord::Base
  attr_accessible :lastname, :firstname, :born_at, :female, :zipcode

  validates :lastname, presence: true, length: { maximum: 50 }
  validates :firstname, presence: true, length: { maximum: 50 }
  validates :born_at, presence: true
end
