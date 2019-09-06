#!/bin/ruby

require "json"
require "stringio"

# Complete the hourglassSum function below.
def hourglassSum(a)
  hour_glass_sums = []
  (0..3).each do |i|
    (0..3).each do |j|
      hour_glass_sums << [a[i][j], a[i][j + 1], a[i][j + 2], a[i + 1][j + 1], a[i + 2][j], a[i + 2][j + 1], a[i + 2][j + 2]].reduce(&:+)
    end
  end
  hour_glass_sums.max
end

fptr = File.open(ENV["OUTPUT_PATH"], "w")

arr = Array.new(6)

6.times do |i|
  arr[i] = gets.rstrip.split(" ").map(&:to_i)
end

result = hourglassSum arr

fptr.write result
fptr.write "\n"

fptr.close()
