class Affiliation < ActiveRecord::Base
  attr_accessible :group_id, :child_id

  belongs_to :group
  belongs_to :child

  validates :group_id, presence: true
  validates :child_id, presence: true

  def childtogroup!(group,child)
    Affiliations.create!(group_id: group.id,child_id: child.id)
  end

end
