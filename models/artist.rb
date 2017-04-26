require_relative('../db/sql_runner.rb')
require('pry-byebug')
class Artist
attr_reader :id
attr_accessor :name, :genre


  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @genre = params['genre']
  end 

  def save()
    sql = "
    INSERT INTO artists (
    name,
    genre
    ) VALUES (
    '#{@name}',
    '#{@genre}'
    )
    RETURNING id;"

    result = SqlRunner.run(sql)
    @id = result[0]["id"].to_i
  end 

  def update()
    sql = "
    UPDATE artists SET(
    name,
    genre
    ) = (
    '#{@name}',
    '#{@genre}'
    )
    WHERE id = #{@id};"
    SqlRunner.run(sql)
  end


  def Artist.all()
    sql = "SELECT * FROM artists;"
    return SqlRunner.run(sql).map { |artist| Artist.new(artist) }
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = #{@id};"
    SqlRunner.run(sql)
  end 

  def Artist.find(id)
    sql = "SELECT * FROM artists WHERE id = #{id}"
      artist = Artist.new(SqlRunner.run(sql)[0])
      return artist
  end 

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
      album_hashes = SqlRunner.run(sql)
      album_objects = album_hashes.map do
        |album_hash| 
          Album.new(album_hash)
      end
      return album_objects
  end 
end 