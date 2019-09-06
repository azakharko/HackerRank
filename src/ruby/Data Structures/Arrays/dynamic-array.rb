#!/bin/ruby

require "json"
require "stringio"

#
# Complete the 'dynamicArray' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts following parameters:
#  1. INTEGER n
#  2. 2D_INTEGER_ARRAY queries
#

def dynamicArray(n, queries)
  # Write your code here
  seq = []
  seqList = Array.new(n)
  lastAns = 0
  s0 = 0
  s1 = 0
  res = []
  n.times.each { |i| seqList[i] = [] }

  queries.each do |array|
    # print (s0)
    if array[0] == 1
      rowIndex = (array[1] ^ lastAns) % n
      seqList[rowIndex] << array[2]
    else
      # append (s1)
      colIndex = 0
      rowIndex = (array[1] ^ lastAns) % n
      seq = seqList[rowIndex]
      colIndex = array[2] % seq.size
      lastAns = seq[colIndex]
      res << lastAns
    end
  end
  res
end

fptr = File.open(ENV["OUTPUT_PATH"], "w")

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0].to_i

q = first_multiple_input[1].to_i

queries = Array.new(q)

q.times do |i|
  queries[i] = gets.rstrip.split.map(&:to_i)
end

result = dynamicArray n, queries

fptr.write result.join "\n"
fptr.write "\n"

fptr.close()
