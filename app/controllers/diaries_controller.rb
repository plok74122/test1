class DiariesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_diary, only: [:destroy]

	def index
		@diaries = Diary.all
		@diary = Diary.new
	end

	def create
		@diary = current_user.diaries.new(params_permit)
		@diary.save
		redirect_to diaries_path
	end

	def destroy
		@diary.destroy
		redirect_to diaries_path
	end
	private
		def set_diary
			@diary = Diary.find(params[:id])
		end

		def params_permit
			params.require(:diary).permit(:title, :context)
		end
end
