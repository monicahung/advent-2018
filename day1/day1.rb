require 'set'

def main(file_name)
  input = File.read(file_name)
  # Convert string inputs into integer array
  freqs = input.split.map(&:to_i)
  # Part 1 Solution
  puts checksum(freqs, 0)
  # Part 2 Solution
  puts repeat_freq(freqs, 0)
end

# Finds the final frequency
def checksum(nums, initial_val)
  sum = initial_val
  nums.each do |val|
    sum += val
  end
  sum
end

# Finds the first frequency that has been found before
def repeat_freq(nums, initial_val)
  sum = initial_val
  past_freqs = Set[initial_val]
  index = 0
  # This is an infinite loop so assumes that the problem has a solution
  while true
    sum += nums[index]
    return sum if past_freqs.add?(sum).nil?
    index += 1
    # Reset the index if it needs to loop
    index = 0 if index == nums.length
  end
end

main('input_pt1.txt')
