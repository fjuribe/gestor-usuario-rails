class AddApiKeyToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :api_key, :string
#4 a cada user se le asigna un api key
    User.find_each do |user|
       user.api_key = user.generate_api_key
       user.save
    end
  end
end
