class Study < ActiveRecord::Base
	has_many :studysites
	has_many :sites, through: :studysites 

	validates :title, uniqueness: {message: 'The study title and investigator already exists.', case_sensitive: false, scope: :principal_investigator}
	validates :title, :principal_investigator, presence: true  
end
