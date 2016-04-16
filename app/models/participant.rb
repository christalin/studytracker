class Participant < ActiveRecord::Base
	has_many :participantstudysites

	has_many :studysites, through: :participantstudysites

	validates :partname, uniqueness: {message: 'The participant is already enrolled for this study.', case_sensitive: false, scope: [:dob ,:gender]}
	validates :partname, :dob, :gender, presence: true  
end
