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
 'year' => '1982',
 'artist_id' => artist1.id
  })
album1.save()

album2 = Album.new({
 'name' => 'Bad',
 'year' => '1987',
 'artist_id' => artist1.id
  })
album2.save()
artist1.albums
binding.pry
nil 