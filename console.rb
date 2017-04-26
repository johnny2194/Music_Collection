require('pry-byebug')
require_relative('models/artist.rb')
require_relative('models/album.rb')

artist1 = Artist.new({
 'name' => 'Michael Jackson',
 'genre' => 'Pop'
  })
artist1.save()

album1 = Album.new({
 'name' => 'Thriller',
 'year' => '1982'
  })
album1.save()

album2 = Album.new({
 'name' => 'Bad',
 'year' => '1987'
  })
album2.save()

binding.pry 
nil 