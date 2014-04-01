# == Schema Information
#
# Table name: goals
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  user_id     :integer
#  private     :boolean
#  created_at  :datetime
#  updated_at  :datetime
#  completed   :boolean
#  complete    :boolean          default(FALSE)
#

class Goal < ActiveRecord::Base
  validates :title, :user_id, :presence => true
  validates :private, :inclusion => { in: [true, false] }

  belongs_to(
    :user,
    :primary_key => :id,
    :foreign_key => :user_id,
    :class_name => "User"
  )

  has_many(:comments, :as => :commentable)
end
