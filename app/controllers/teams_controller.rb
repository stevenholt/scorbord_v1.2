class TeamsController < ApplicationController
	before_action :set_team, only: [:show, :edit, :update, :destroy]

	def new
		@team = Team.new
		@sport_program = SportProgram.find(params[:sport_program_id])
	end

	def create
		#@sport_program = SportProgram.find(params[:sport_program_id])
		@team = Team.new(team_params)
		if @team.save
			flash[:success] = "Team successfully created"
      		redirect_to @team
      	else
      		#Rerender the page with error
      		render 'new'
      		flash.now[:danger] = "didn't create the team"
      	end
	end

	def show
		@team = Team.find(params[:id])
	end

	private

		def set_team
			@team = Team.find(params[:id])
		end

		def team_params
			params.require(:team).permit(:sport_program_id, :level, :classification, :region)
		end
end
