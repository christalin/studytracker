class Participantstudysite < ActiveRecord::Base
	belongs_to :participant 
	belongs_to :studysite
 
  	validates :participant_id, uniqueness: {message: 'The participant is already enrolled for this study.', scope: [:study_id]}
	#validates_uniqueness_of :studysite_id, :scope => :participant_id
	#has_many :studysites
end
