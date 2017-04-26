require_relative('../db/sql_runner.rb')

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
  puts result[0]
  @id = result[0]["id"].to_i
end 
end 