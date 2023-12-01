#!/usr/bin/ruby
# frozen_string_literal: true

def build_val(line)
  line.length < 2 ? (line << line).to_i : "#{line[0, 1]}#{line[-1]}".to_i
end

def part_one
  input = File.open('input/input.txt')
  numbers = []

  input.each_line do |line|
    nums = line.delete('^0-9')
    numbers << build_val(nums)
  end

  puts "Part one: #{numbers.sum}"
end

def part_two
  input = File.open('input/input.txt')
  numbers = []

  subs = {
    'one' => 'o1e',
    'two' => 't2o',
    'three' => 't3e',
    'four' => 'f4r',
    'five' => 'f5e',
    'six' => 's6x',
    'seven' => 's7n',
    'eight' => 'e8t',
    'nine' => 'n9e'
  }

  re = Regexp.union(subs.keys)

  input.each_line do |line|
    nums = line.gsub(re, subs)
    nums = nums.gsub(re, subs).delete('^0-9')

    numbers << build_val(nums)
  end

  puts "Part two: #{numbers.sum}"
end

part_one
part_two
