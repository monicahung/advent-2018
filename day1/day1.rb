require 'set'

def main(file_name)
  input = File.read(file_name)
  freqs = input.split.map(&:to_i)
  puts checksum(freqs, 0)
  puts repeat_freq(freqs, 0)
end

def checksum(nums, initial_val)
  sum = initial_val
  nums.each do |val|
    sum += val
  end
  sum
end

def repeat_freq(nums, initial_val)
  sum = initial_val
  past_freqs = Set[initial_val]
  index = 0
  while true do
    sum += nums[index]
    return sum if past_freqs.add?(sum).nil?
    index += 1
    # Reset the index if it needs to loop
    index = 0 if index == nums.length
  end
end

main('input_pt1.txt')
