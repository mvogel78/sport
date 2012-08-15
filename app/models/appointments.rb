class Appointments < ActiveRecord::Base
  belongs_to :group
  has_many :children, :through => :groups

  validates :group_id, presence: true
  validates :date_at, presence: true
end
