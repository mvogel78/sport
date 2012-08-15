class Appointment < ActiveRecord::Base
  attr_accessible :group_id, :date_at, :canceled, :reason, :comment

  belongs_to :group
  has_many :children, :through => :groups
  has_many :attendances

  validates :group_id, presence: true
  validates :date_at, presence: true

end
