# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# AdminUser.create!(email: 'javier@gmail.com', password: '123456', password_confirmation: '123456')

Photo.create!(
  name: 'vegeta', 
  url: 'https://www.alfabetajuega.com/wp-content/uploads/2019/12/Dragon-Ball-Super-Vegeta-Lucha.jpg', 
  description: 'principe vegeta', 
  license: 'copyleft')
Photo.create!(
  name: 'goku ultra instinto', 
  url: 'https://www.alfabetajuega.com/wp-content/uploads/2019/08/dragon-ball-goku.jpg',
  description: 'goku superando sus límites', 
  license: 'copyright')
Photo.create!(
  name: 'goku', 
  url: 'https://statics.vrutal.com/m/c8ea/c8eab9351b48980eb4028911d41e23db.jpg', 
  description: 'goku', 
  license: 'copyleft')
Photo.create!(
  name: 'gran sacerdote', 
  url: 'https://www.alfabetajuega.com/wp-content/uploads/2019/12/alfabetajuega-gran-sacerdote-dragon-ball-super-30122019-770x433.jpg', 
  description: 'deidad', 
  license: 'copyleft')
Photo.create!(
  name: 'bills', 
  url: 'https://www.tonica.la/__export/1584396868552/sites/debate/img/2020/03/16/bills_sama.jpg_423682103.jpg', 
  description: 'dios de la destrucción', 
  license: 'creative_commons')
Photo.create!(
  name: 'wiss', 
  url: 'https://depor.com/resizer/hal7wYqhsmNuDQx8uIaufdb8rEA=/980x528/smart/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/XGQSSYVMQVBTVDLZ6IRKSOSI5Y.jpg', 
  description: 'ángel ,maestro del dios bills', 
  license: 'copyleft')
Photo.create!(
  name: 'broly', 
  url: 'https://www.cinemascomics.com/wp-content/uploads/2018/11/pelicula-dragon-ball-super-broly-sorpresa-villano.jpg', 
  description: 'super sayajin legendario', 
  license: 'copyleft')

Photo.create!(
  name: 'gogeta', 
  url: 'https://www.24horas.cl/incoming/gogeta-dragon-ball-super-broly-x-770x433jpg-3037317/ALTERNATES/BASE_LANDSCAPE/Gogeta-Dragon-Ball-Super-Broly-x-770x433.jpg', 
  description: 'fusion de veget y goku', 
  license: 'copyleft')

Photo.create!(
  name: 'frezeer', 
  url: 'https://img.europapress.es/fotoweb/fotonoticia_20171022111736_420.jpg', 
  description: 'villano enemigo de goku', 
  license: 'copyleft')

Photo.create!(
  name: 'jiren', 
  url: 'https://img.europapress.es/fotoweb/fotonoticia_20171112153637_420.jpg', 
  description: 'es el luchador mas poderoso del universo', 
  license: 'copyleft')

