class Child < ActiveRecord::Base
  attr_accessible :lastname, :firstname, :born_at, :female, :zipcode

  has_many :affiliations

  validates :lastname, presence: true, length: { maximum: 50 }
  validates :firstname, presence: true, length: { maximum: 50 }
  validates :born_at, presence: true

  def ingroup?(child)
    affiliations.find_by_child_id(child.id)
  end

  def togroup!(group)
    affiliations.create!(group_id: group.id)
  end
end
