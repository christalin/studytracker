class Study < ActiveRecord::Base
	has_many :studysites
	has_many :sites, through: :studysites 

	#has_many :participantstudies
	#has_many :participants, through: :participantstudies 

	#validates :principal_investigator, uniqueness: true
	#validates_uniqueness_of :title, scope: :principal_investigator, allow_nil: true
	validates :title, uniqueness: {message: 'The study title and investigator already exists.', case_sensitive: false, scope: :principal_investigator}
	#validates :principal_investigator, uniqueness: {message: 'The study title and investigator already exists.', case_sensitive: false, scope: :title}, on: :create
	#validates :status, acceptance: {message: 'Status must be selected.'}

	#validates :principal_investigator, uniqueness: true, on: :create


end
