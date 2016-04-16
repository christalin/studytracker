class Studysite < ActiveRecord::Base
	belongs_to :study 
	belongs_to :site 

	has_many :participantstudysites
	has_many :participants, through: :participantstudysites 
end
