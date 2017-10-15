require_relative('./models/customer.rb')
require_relative('./models/film.rb')
require_relative('./models/ticket.rb')
require('pry')

customer_1 = Customer.new({
  'name' => 'Jay Gatsby',
  'funds' => 500
  })

customer_1.save()

customer_2 = Customer.new({
  'name' => 'Daisy Buchanan',
  'funds' => 100
  })

customer_2.save()

customer_3 = Customer.new({
  'name' => 'Nick Carraway',
  'funds' => 50
  })

customer_3.save()


film_1 = Film.new({
  'title' => 'Eternal Sunshine of the Spotless Mind',
  'price' => 3
  })

film_1.save()

film_2 = Film.new({
  'title' => 'The Grand Budapest Hotel',
  'price' => 4
  })

film_2.save()

film_3 = Film.new({
  'title' => 'Grandmas Boy',
  'price' => 2
  })

film_3.save()

all_customers = Customer.all()
for customer in all_customers
  puts customer.name
end

#film_2.delete()

all_films = Film.all()
for film in all_films
  puts film.title
end

ticket_1 = Ticket.new({
  'customer_id' => customer_1.id,
  'film_id' => film_1.id
  })

ticket_1.save()

ticket_2 = Ticket.new({
  'customer_id' => customer_2.id,
  'film_id' => film_3.id
  })

ticket_2.save()

puts "PRINTING OUT: customer_1.films() ..."
customer_films = customer_1.films()
for film in customer_films
  puts "Film ID: #{film.id.to_s()}"
  puts "Film Title: #{film.title}"
  puts "Film Price: #{film.price.to_s()}"
end


puts "PRINTING OUT: film_1.customers() ..."
film_customers = film_1.customers()
for customer in film_customers
  puts "Customer ID: #{customer.id.to_s()}"
  puts "Customer Name: #{customer.name}"
  puts "Customer Funds: #{customer.funds.to_i()}"
end

puts "Funds pre purchase: #{customer_1.funds}"
customer_1.purchase_ticket_for(film_2)
puts "Funds post purchase: #{customer_1.funds}"


puts "Customer 1 tickets purchased: #{customer_1.number_of_tickets}"

binding.pry
nil
