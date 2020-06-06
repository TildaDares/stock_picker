def stock_adviser(integer_stocks) 
    max_profit = 0
    index_buy = 0
    index_sell = 0
   (integer_stocks.length - 1).downto(1) do |j|
        for i in (0..j-1) 
            range = integer_stocks[j] - integer_stocks[i]
            if range > max_profit
                max_profit = range
                index_buy = i
                index_sell = j
            end
        end
    end
    if(max_profit == 0)
        puts "Save your money for another day"
    else
        puts "Best day to buy and sell is day #{index_buy} and day #{index_sell} with a profit of $#{max_profit}"
    end
end

puts "Enter the stock prices for each day of the week (separate prices with a space)"
stock_prices = gets.chomp.split(' ')

while stock_prices.length < 7 || stock_prices.any?(/\D/)
    puts "Please input the stock prices for seven days (1 week or more)"
    stock_prices = gets.chomp.split(' ')
end

integer_stocks = stock_prices.map do |number|
    number = number.to_i
end

stock_adviser(integer_stocks)