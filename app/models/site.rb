class Site < ActiveRecord::Base
	has_many :studysites
	has_many :studies, through: :studysites 

	#validates_uniqueness_of :name, scope: :location, allow_nil: true
	validates :name, uniqueness: {message: 'The site name and location already exists.', case_sensitive: false, scope: :location}
	validates :name, :location, presence: true  
	
end
