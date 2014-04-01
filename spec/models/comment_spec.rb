# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_id   :integer
#  commentable_type :string(255)
#  author_id        :integer
#  body             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

require 'spec_helper'

describe Comment do

end
