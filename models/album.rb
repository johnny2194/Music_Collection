require_relative ('../db/sql_runner.rb')

class Album

  attr_accessor :name, :year
  attr_reader :id

  def initialize(params)
    @name = params['name']
    @year = params['year'].to_i
    @id = params['id'].to_i if params['id']
    @artist_id = params['artist_id'].to_i if params['artist_id']
  end

end 