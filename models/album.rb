require_relative ('../db/sql_runner.rb')

class Album

  attr_accessor :name, :year
  attr_reader :id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @year = params['year'].to_i
    @artist_id = params['artist_id'].to_i if params['artist_id']
  end

  def save()
    sql = "
    INSERT INTO albums (
    name,
    year,
    artist_id
    ) VALUES (
    '#{@name}',
    #{@year},
    #{@artist_id}
    )
    RETURNING id;"
    result = SqlRunner.run(sql)
    @id = result[0]["id"].to_i
  end 

  def update()
    sql = "
    UPDATE albums SET(
    name,
    year,
    artist_id
    ) = (
    '#{@name}',
    #{@year},
    #{@artist_id}
    )
    WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def Album.all()
    sql = "SELECT * FROM albums;"
    return SqlRunner.run(sql).map { |album| Album.new(album) }
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = #{@id};"
    SqlRunner.run(sql)
  end 

  def Album.find(id)
    sql = "SELECT * FROM albums WHERE id = #{id}"
      album = Album.new(SqlRunner.run(sql)[0])
      return album
  end 

  def artist()
    sql = "SELECT * FROM albums WHERE id = #{@artist_id};"
    result_hash = SqlRunner.run(sql).first
    return Artist.new(result_hash) 
  end





end 