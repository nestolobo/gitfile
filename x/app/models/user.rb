class User < ActiveRecord::Base
  belongs_to :room_type
  belongs_to :room

  def to_s
  	self.name + " (" + (self.interest_level == 1? "Going!":(self.interest_level == 2? "Maybe...":"Not going")) + ")"
  end
end
