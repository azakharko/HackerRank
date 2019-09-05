#!/bin/ruby

require "json"
require "stringio"

# Complete the divisibleSumPairs function below.
def divisibleSumPairs(n, k, ar)
  count = 0
  ar.each_with_index do |outer, i|
    ar.each_with_index do |inner, j|
      if i != j
        count += 1 if ((outer + inner) % k == 0 and i > j)
      end
    end
  end
  count
end

fptr = File.open(ENV["OUTPUT_PATH"], "w")

nk = gets.rstrip.split

n = nk[0].to_i

k = nk[1].to_i

ar = gets.rstrip.split(" ").map(&:to_i)

result = divisibleSumPairs n, k, ar

fptr.write result
fptr.write "\n"

fptr.close()
