class Study < ActiveRecord::Base
	has_many :studysites
	has_many :sites, through: :studysites 
end
