require 'set'

def main(file_name)
  input = File.read(file_name)
  box_ids = input.split
  # Part 1 Solution
  puts categorize(box_ids)
end

def categorize(box_ids)
  # Sums of ids that have exactly that number of appearances
  three = 0
  two = 0
  box_ids.each do |id|
    # Create an object to track number of appearances of chars
    dict = {}
    # Process into char array to check how many are of each char
    id.chars.each do |letter|
      if dict.key?(letter)
        dict[letter] += 1
      else
        dict[letter] = 1
      end
    end
    # Check the number of appearances of each letter and categorize this id
    two += 1 if dict.value?(2)
    three += 1 if dict.value?(3)
  end
  two * three
end

main('input_pt1.txt')
