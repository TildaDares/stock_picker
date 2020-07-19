# frozen_string_literal: true

def stock_adviser(integer_stocks)
  max_profit = 0
  index_buy = 0
  index_sell = 0
  (integer_stocks.length - 1).downto(1) do |j|
    (0..j - 1).each do |i|
      range = integer_stocks[j] - integer_stocks[i]
      next unless range > max_profit

      max_profit = range
      index_buy = i
      index_sell = j
    end
  end
  if max_profit == 0
    puts 'Save your money for another day'
  else
    puts "Best day to buy and sell is day #{index_buy} and day #{index_sell} with a profit of $#{max_profit}"
  end
end

puts 'Enter the stock prices for each day of the week (separate prices with a space)'
stock_prices = gets.chomp.split(' ')

while stock_prices.length < 7 || stock_prices.any?(/\D/)
  puts 'Please input the stock prices for seven days (1 week or more)'
  stock_prices = gets.chomp.split(' ')
end

integer_stocks = stock_prices.map(&:to_i)

stock_adviser(integer_stocks)
