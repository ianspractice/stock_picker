def stock_picker(array)
#buy_date; Get all numbers of array minus the last number
#sell_date: Get all numbers of array minus the first number
buy_date = array[(0...-1)]
sell_date = array[(1..-1)]
result = Hash.new{0}
  buy_date.each_with_index do |buy_day, buy_index|
    sell_date.each_with_index do |sell_day, sell_index|
#Subract buy-date from sell-date for each number only if sell-date index is greater than or to buy-date
      if sell_index >= buy_index
          result[sell_day - buy_day] = [buy_index, sell_index + 1]
      end
    end
  end
  #find key for highest return
  best_return = result.keys.max
  #put buy_day and sell_day indexes
  p "Buying on #{result[best_return][0]} and selling on #{result[best_return][1]} will yield the highest return of $#{best_return}."
  #return array of index of best days
  result[best_return]
end

stock_picker([17,3,6,9,15,8,6,1,10])

stock_picker([1, 2, 3, 4])

stock_picker([5, 4, 3, 2, 1, 0])

def better_stock_picker(arr_stocks)
  #find the max number not including the first day
  int_sell_day = arr_stocks.drop(1).max()
  #find the min number in the range from the first day up to the index of the sell_day
  int_buy_day = arr_stocks[0..arr_stocks.find_index(int_sell_day)].min()
  p [arr_stocks.find_index(int_buy_day), arr_stocks.find_index(int_sell_day)]
end

