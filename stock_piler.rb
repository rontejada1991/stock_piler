def stock_picker stock_prices

  best_day = [0, 0] # Profit of 0
  max_profit = 0

  # 1. Compare buying index 0 to all other sell indexes. 
  # 2. With each comparison, compare with max profit.
  # 3. If it exceeds max profit, it becomes max profit and best day.
  # 4. Once finished, increase buying index to 1 and compare
  # again.
  # 4. Return array with buy, sell days

  buy_day = 0

  while buy_day < stock_prices.length
    # As buy_day increases by 1, it has to be compared to all the
    # sell days that come after it
    sell_day = buy_day + 1
    while sell_day < stock_prices.length

      current_profit = stock_prices[sell_day] - stock_prices[buy_day]
      if current_profit > max_profit
        best_day = [buy_day, sell_day]
        max_profit = current_profit
      end
      sell_day += 1
    end
    buy_day += 1
  end

  puts "Max profit is " + max_profit.to_s
  return best_day

end

puts "This stock piler will take in any number of days and let you know which day it's the most profitable to buy and sell your stocks. These days will be displayed as such : [Buy Day, Sell Day]. As well as give you the max profit you are making"

stock_prices_one = [17,3,6,9,15,8,6,1,10]
puts "Next 9 days : " + stock_prices_one.inspect
puts stock_picker(stock_prices_one).inspect

4.times do
  stock_prices_shuffled = stock_prices_one.shuffle
  puts "Next 9 days : " + stock_prices_shuffled.inspect
  puts stock_picker(stock_prices_shuffled).inspect
end