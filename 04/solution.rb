#!/usr/bin/ruby
# frozen_string_literal: true

def get_matches(line)
  winning, mine = line.split('|')
  winning = winning.split(':')[1].split(' ').map(&:to_i)
  mine = mine.split(' ').map(&:to_i)

  (winning & mine)
end

def part_one
  input = File.open('input.txt')
  sum = 0
  input.each_line do |line|
    matches = get_matches(line)

    sum += 2**(matches.length - 1) if matches.length.positive?
  end

  puts "Part one: #{sum}"
end

def compute_copies(list)
  list.each.with_index do |item, index|
    matches, copies = item

    (1..matches).each do |m|
      list[index + m][1] += copies
    end
  end

  list.map { |a| a[1] }.sum
end

def part_two
  input = File.open('input.txt')
  built_data = []

  input.each_line do |line|
    matches = get_matches(line)
    built_data << [matches.length, 1]
  end

  sum = compute_copies(built_data)
  puts "Part two: #{sum}"
end

part_one
part_two
