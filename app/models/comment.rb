class Comment < ActiveRecord::Base

	belongs_to :commentable, :polymorphic => true

	belongs_to :user
	
end

# == Schema Information
#
# Table name: comments
#
#  id               :integer         not null, primary key
#  content          :text
#  commentable_id   :integer
#  commentable_type :string(255)
#  user_id          :integer
#  created_at       :datetime
#  updated_at       :datetime
#

