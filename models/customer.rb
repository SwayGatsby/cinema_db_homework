require_relative('../db/sql_runner.rb')

class User

  attr_reader(:id)
  attr_accessor(:cash, :name)

  def initialize(options)
    @id = options['id'].to_i()
    @name = options['name']
    @cash = options['cash'].to_i()
  end

  def save()
    sql = "INSERT INTO customers
    (
      name,
      cash
    )
    VALUES (
      $1, $2
    )
    RETURNING id"
    values = [@name, @cash]
    location = SqlRunner.run(sql, values)
    @id = customer['id'].to_i
  end



end
