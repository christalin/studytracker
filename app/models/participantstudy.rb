class Participantstudy < ActiveRecord::Base
	belongs_to :study 
	belongs_to :participant
end
