class Comment < ActiveRecord::Base
	include ActiveModel::ForbiddenAttributesProtection
	belongs_to :post

	validates_presence_of :body
end
