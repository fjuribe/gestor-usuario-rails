# == Schema Information
#
# Table name: photos
#
#  id          :bigint           not null, primary key
#  description :text             default(""), not null
#  license     :integer          default("copyright")
#  name        :string(150)
#  url         :string
#  visibility  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Photo < ApplicationRecord
	enum license: [:copyright,:copyleft,:creative_commons]
	enum visibility: [:pub,:pri]
   


   
    #hace que solo pueda ingresar las fotos con licencias del enum
    validates :name, :url, :user_id, presence: true
	validates :license, inclusion:{in: Photo.licenses}
	validates :visibility, inclusion:{in: Photo.visibilities}

	belongs_to :user
end
