class Message < ActiveRecord::Base
	belongs_to :artist
	belongs_to :user

	def accept_message
		self.accepted = true
	end

	def decline_message
		self.accepted = false
	end
end
