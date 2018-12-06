require 'pry'

def main(file_name)
  input = File.read(file_name)
  claims = input.split("\n")
  # Parsing the input into int arrays
  claims_formatted = []
  claims.each do |claim|
    claims_formatted << claim.tr('#@,:x', ' ')
  end
  claims = []
  claims_formatted.each do |claim|
    claims << claim.split.map(&:to_i)
  end
  # Solution Part 1
  puts overlapping(claims)
  # Solution Part 2
  puts my_overlapping(claims)
end

# xdist = claim[1]
# ydist = claim[2]
# xlength = claim[3]
# ylength = claim[4]
def overlapping(claims)
  # Make the fabric
  x = Array.new(1000)
  (0..(x.length - 1)).each do |row|
    x[row] = Array.new(1000, 0)
  end
  overlap = 0
  # Apply each claim and count the overlaps
  claims.each do |claim|
    (0..(claim[3] - 1)).each do |xind|
      (0..(claim[4] - 1)).each do |yind|
        square = x[claim[1] + xind][claim[2] + yind]
        overlap += 1 if square == 1
        x[claim[1] + xind][claim[2] + yind] += 1
      end
    end
  end
  overlap
end

# claimnumber = claim[0]
# xdist = claim[1]
# ydist = claim[2]
# xlength = claim[3]
# ylength = claim[4]
def my_overlapping(claims)
  # Make the fabric
  x = Array.new(1000)
  (0..(x.length - 1)).each do |row|
    x[row] = Array.new(1000, 0)
  end
  untouched = Array.new(claims.length, true)
  # Apply each claim and count the overlaps
  claims.each do |claim|
    (0..(claim[3] - 1)).each do |xind|
      (0..(claim[4] - 1)).each do |yind|
        square = x[claim[1] + xind][claim[2] + yind]
        # It's free real estate, take it as your own
        if square.zero?
          x[claim[1] + xind][claim[2] + yind] = claim[0]
        else
          untouched[square-1] = false
          untouched[claim[0]-1]=false
        end
      end
    end
  end
  num = untouched.find_index(true)
  return num + 1 unless num.nil?
  'NOBODY IS PERFECT'
end

main('input_pt1.txt')
# main('small_input.txt')
