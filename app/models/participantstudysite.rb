class Participantstudysite < ActiveRecord::Base
	belongs_to :participant 
	belongs_to :studysite

	validates_uniqueness_of :studysite_id, :scope => :participant_id
	#has_many :studysites
end
