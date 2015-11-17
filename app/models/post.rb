class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	validates :post_text,
		presence: true

	validates :cover_image,
		presence: true
end
