require_relative('../db/sql_runner.rb')
require_relative('customer.rb')
require_relative('film.rb')

class Ticket

  attr_reader(:customer_id, :film_id, :id)

  def initialize(options)
    @id = options['id'].to_i()
    @customer_id = options['customer_id'].to_i()
    @film_id = options['film_id'].to_i()
  end

  def save()
    sql = "INSERT into tickets
    (
      customer_id,
      film_id
    )
    VALUES
    ($1, $2)
    RETURNING *"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values)
    @id = ticket[0]['id'].to_i()

  end

  def self.all()
    sql = "SELECT * FROM tickets"
    values = []
    tickets = SqlRunner.run(sql, values)
    result = tickets.map{|ticket| Ticket.new(ticket)}
    return result
  end

  def update()
    sql = "UPDATE tickets
    SET (
    customer_id,
    film_id
    ) =
    ($1, $2)
    WHERE id = $3
    "
    values = [@customer_id, @film_id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM tickets
    WHERE ID = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELTE FROM tickets"
    values = []
    SqlRunner.run(sql,values)
  end



end
