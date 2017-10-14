require_relative('../db/sql_runner.rb')

class Film

attr_reader(:id, :title)
attr_accessor(:price)

  def initialize(options)
    #  id, title price
    @id = options['id'].to_i()
    @title = options['title']
    @price = options['price'].to_i()
  end

  def save()
    sql = "INSERT INTO films
    (
      title,
      price
    )
    VALUES ($1, $2)
    RETURNING *"
    values = [@title, @price]
    film = SqlRunner.run(sql, values)
    @id = film[0]['id'].to_i
  end


end
