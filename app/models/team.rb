class Team < ActiveRecord::Base
	belongs_to :sport_program
	has_one :school, through: :sport_program

	validates :sport_program_id, presence: true 
end
