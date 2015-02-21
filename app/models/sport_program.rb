class SportProgram < ActiveRecord::Base
	belongs_to :school
	has_many :teams, dependent: :destroy
	validates :school_id, presence: true
	validates :sport, presence: true
	validates :sport, uniqueness: { scope: :school_id }
end
