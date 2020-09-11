class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :characters
  has_many :tags

end
