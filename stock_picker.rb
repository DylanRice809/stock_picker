stock_prices = [
25,
12,
9,
24,
8,
18,
9,
6,
15,
16,
20,
28,
23,
9,
22,
22,
8,
7,
26,
14,
16,
17,
18,
18,
15,
21,
17,
24,
19,
19]

def stock_picker (prices)
    max_return = 0
    winners = {}
    latter_prices = []
    times_shifted = 0
    prices.each { |price| latter_prices << price }
    prices.each_with_index do |price_1, index_1|
        latter_prices.shift
        # used to adjust the index of the second value to ensure an accurate index
        times_shifted += 1
        latter_prices.each_with_index do |price_2, index_2|
            if (price_2 - price_1) > max_return
                max_return = price_2 - price_1
                winners[:index] = [index_1, index_2 + times_shifted]
                winners[:max_return] = max_return
            end
        end
    end
    winners
end

optimal_choice = stock_picker(stock_prices)

puts "A maximum profit of $#{optimal_choice[:max_return]} can be achieved by buying on day #{optimal_choice[:index][0]+1} and selling on day #{optimal_choice[:index][1]+1}."