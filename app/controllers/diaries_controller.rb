class DiariesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_diary, only: [:update, :destroy]

	def index
		@diaries = Diary.all
		if params[:diary_id]
			@diary = Diary.find(params[:diary_id])
			if not current_user==@diary.user
				flash[:alert] = "It's not your diary!"
				redirect_to diaries_path
			end
		else
			@diary = Diary.new
		end
	end

	def create
		@diary = current_user.diaries.new(params_permit)
		if @diary.save
			flash[:notice] = "Create Success!"
			redirect_to diaries_path
		else
			@diaries = Diary.all
			flash[:alert] = "Create Failure"
			render action: :index
		end
	end

	def update
		if current_user==@diary.user
			@diary.update(params_permit)
			redirect_to diaries_path
		else
			flash[:alert] = "It's not your diary!"
			redirect_to diaries_path
		end
	end

	def destroy
		if current_user==@diary.user
			@diary.destroy
			redirect_to diaries_path
		else
			flash[:alert] = "It's not your diary!"
			redirect_to diaries_path
		end
	end
	private
		def set_diary
			@diary = Diary.find(params[:id])
		end

		def params_permit
			params.require(:diary).permit(:title, :context)
		end
end
