class Participant < ActiveRecord::Base
	has_many :participantstudies
	has_many :studies, through: :participantstudies 
end
