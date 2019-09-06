#!/bin/ruby

require "json"
require "stringio"

# Complete the matchingStrings function below.
def matchingStrings(strings, queries)
  result = []
  queries.each do |qs|
    count = 0
    strings.each { |s| count += 1 if qs.include?(s) }
    result << count
  end
  result.each { |r| p r }
end

fptr = File.open(ENV["OUTPUT_PATH"], "w")

strings_count = gets.to_i

strings = Array.new(strings_count)

strings_count.times do |i|
  strings_item = gets.to_s.rstrip
  strings[i] = strings_item
end

queries_count = gets.to_i

queries = Array.new(queries_count)

queries_count.times do |i|
  queries_item = gets.to_s.rstrip
  queries[i] = queries_item
end

res = matchingStrings strings, queries

fptr.write res.join "\n"
fptr.write "\n"

fptr.close()
