class Affiliation < ActiveRecord::Base
  attr_accessible :group_id, :child_id

  belongs_to :group
  belongs_to :child

  validates :group_id, presence: true
  validates :child_id, presence: true

end
