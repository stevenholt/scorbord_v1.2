class School < ActiveRecord::Base
	has_many :sport_programs, dependent: :destroy
	has_many :teams, through: :sport_programs
end
