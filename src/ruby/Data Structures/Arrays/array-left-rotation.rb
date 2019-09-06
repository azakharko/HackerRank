#!/bin/ruby

require "json"
require "stringio"

def shift_array(n, arr)
  n.times.each { |item| arr << arr.shift() }
  puts arr.join(" ")
end

nd = gets.rstrip.split
n = nd[0].to_i
d = nd[1].to_i
a = gets.rstrip.split(" ").map(&:to_i)

shift_array(d, a)
