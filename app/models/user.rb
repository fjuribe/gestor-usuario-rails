# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  api_key                :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :photos

#asignar un api key cuando generamos un usuario
  before_create do |user|
     user.api_key = user.generate_api_key
  end


  #genera un unico api key
  def generate_api_key
  	loop do
  		token = Devise.friendly_token
  		break token unless User.where(api_key: token).first
    end
  end
end
