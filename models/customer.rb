require_relative('../db/sql_runner.rb')

class Customer

  attr_reader(:id)
  attr_accessor(:funds, :name)

  def initialize(options)
    @id = options['id'].to_i()
    @name = options['name']
    @funds = options['funds'].to_i()
  end

  def save()
    sql = "INSERT INTO customers
    (
      name,
      funds
    )
    VALUES ($1, $2)
    RETURNING *"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values)
    @id = customer[0]['id'].to_i
  end

end
