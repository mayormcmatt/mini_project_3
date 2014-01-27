class RitlyController < ApplicationController

	def index
		render :index
	end

	def create # create new code
		new_code = params.require(:link_code).permit(:link, :random_string)
		link = Link.create(new_code)
		redirect_to "/go/#{link.id}"
	end

	def show
		id = params[:id]
		@link = Link.find(id)
	end

	def redirect
		random_code = params[:random_string]
		code_link = Link.find_by_random_string(random_code)
		redirect_to "http://#{code_link.link}"
	end

end
