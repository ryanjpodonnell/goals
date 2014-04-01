# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  password_digest :string(255)
#  token           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_reader :password

  validates :username, :password_digest, :presence => true
  validates :username, :uniqueness => true
  validates :password, :length => { :minimum => 6, :allow_nil => true }

  has_many(
    :goals,
    :primary_key => :id,
    :foreign_key => :user_id,
    :class_name => "Goal"
  )

  has_many(:comments, :as => :commentable)

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_token!
    self.token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.token
  end
end
