class Attendance < ActiveRecord::Base
  attr_accessible :appointment_id, :child_id, :absence, :reason, :comment

  belongs_to :child
  belongs_to :appointment
  
  validates :appointment_id, presence: true
  validates :child_id, presence: true
end
