require_relative('../db/sql_runner.rb')
require_relative('customer.rb')
require_relative('film.rb')

class Ticket

  attr_reader(:customer_id, :film_id)

  def initialize(options)
    @customer_id = options['customer_id'].to_i()
    @film_id = options['film_id'].to_i()
  end



end
