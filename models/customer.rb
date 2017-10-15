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

  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    result = customers.map{|customer| Customer.new(customer)}
    return result
  end

  def update()
    sql = "UPDATE customers
    SET (
      name,
      funds
    ) =
    ($1, $2)
    WHERE id = $3
    "
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers
    WHERE ID = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.*, tickets.*
    FROM films
    INNER JOIN tickets
    ON tickets.film_id = films.id
    WHERE customer_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    # results.map{|result| puts result}
    # return results.map{|result| "#{result['name']}: #{result['title']}"}
    return results.map{|result| "#{result['customer_id']}: #{result['title']}"}
  end



end
