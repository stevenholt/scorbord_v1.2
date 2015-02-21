class SportProgramsController < ApplicationController
	before_action :set_sport_program, only: [:new, :create, :show]

	def new
		@sport_program = SportProgram.new
	end

	def create
		@school = School.find(params[:school])
		@sportprogram = @school.sport_programs.build(sport: params[:sport])
		if @sportprogram.save
			flash[:success] = "SportProgram created!"
			redirect_to root_url
		else
			flash.now[:danger] = "That Sport Program already exists at this School"
  			render @school_page
		end
	end

	def show
		#@school = School.find_by(params[:school_id])
		@sportprogram = SportProgram.find_by(params[:id])

	end

	private

		def set_sport_program
			@sport_program = SportProgram.find(params[:id])
		end

		def sport_program_params
			params.require(:sport_program).permit(:sport)
		end
end
