class Diary < ApplicationRecord
	validates_presence_of :user_id
	validates_presence_of :title

	belongs_to :user
end
