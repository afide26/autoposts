class Post < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :content
	validates_presence_of :scheduled_at
	validates_presence_of :content, maximum: 140, message: 'Less than 10 characters please.'
end
