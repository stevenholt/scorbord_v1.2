class SchoolsController < ApplicationController
	
	def index
	    @schools = School.paginate(page: params[:page])
  	end

	def show
		@school = School.find(params[:id])
	end

	def new
		@school = School.new
	end

	def create
		@school = School.new(school_params)
		if @school.save
			# Do something
			flash[:success] = "School successfully created"
      		redirect_to root_url
		else
			# rerender the page with error
			render 'new'
		end
	end

	def edit
	    @school = School.find(params[:id])
	end

	def update
		@school = School.find(params[:id])
	    if @school.update_attributes(school_params)
	      flash[:success] = "School profile updated"
	      redirect_to @school
	    else
	      render 'edit'
    	end		
	end

	def destroy
    	School.find(params[:id]).destroy
    	flash[:success] = "School deleted"
    	redirect_to schools_url
	end

	private

		def school_params
			params.require(:school).permit(:full_name, :short_name, :initials, :mascot, :street, :city, :region, :postal_code)
		end
end
