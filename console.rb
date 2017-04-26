require('pry-byebug')
require_relative('models/artist.rb')

artist1 = Artist.new({
 'name' => 'Michael Jackson',
 'genre' => 'Pop'
  })
artist1.save()

binding.pry 
nil 