# == Schema Information
#
# Table name: admin_users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_admin_users_on_email                 (email) UNIQUE
#  index_admin_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

#0- queremos crear usuarios , pero que ellos creen sus propias contraseñas


#1-envia credenciales al admin para que resetee la contraseña
  after_create{|admin| admin.send_reset_password_instructions}


#2-como divise no permite crear usuarios sin contraseña tenemos que sobreescribir
# su metodo para que nos permite hacerlo asi

def password_required?
   new_record??false:super
	# if self.new_record?
	# 	false
 #    else
 #    	super
 #    end
end



  def to_s
     self.email
  end
end
