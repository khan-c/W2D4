# O(n^2)
def bad_two_sum?(arr, target_sum)
  arr.each_index do |idx|
    ((idx + 1)...arr.length).each do |idx2|
      return true if arr[idx] + arr[idx2] == target_sum
    end
  end

  false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

# O(n*log n)
def okay_two_sum?(arr, target_sum)
  arr.sort!
  arr.each do |el|
    target = target_sum - el
    return true if !binary_search(arr, target).nil?
  end
  false
end

def binary_search(arr, target)
  middle = arr.length/2
  if arr[middle] == target
    return arr[middle]
  elsif arr[middle] < target
    binary_search(arr[middle +1..-1], target)
  elsif arr[middle] > target
    binary_search(arr[0..middle], target)
  else
    nil
  end
end

# arr = [7, 4, 9, 2, 5]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

# O(n)
def two_sum?(arr, target_sum)
  hash = Hash.new

  arr.each do |el|
    hash[el] = el
  end

  arr.each do |el|
    target = target_sum - el
    return false if target == el
    return true if hash.key?(target)
  end

  false
end

arr = [7, 4, 9, 2, 5]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
