class Site < ActiveRecord::Base
	has_many :studysites
	has_many :studies, through: :studysites 
end
