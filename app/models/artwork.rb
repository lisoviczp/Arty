class Artwork < ActiveRecord::Base
	# attr_accessor :artist

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	belongs_to :artist

	# def artist
	# 	self.artist
	# end

	def artist_name
		self.artist.first_name
	end




end
