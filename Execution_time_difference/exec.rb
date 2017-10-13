def my_min(list)
  list.each do |el|
    return el if list.all? { |el2| el <= el2 }
  end
end
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
 p my_min(list)
# Time complexity O(n^2)

def my_min_two(list)
  min= nil
  list.each do |el|
    if min.nil? || el < min
      min = el
    end
  end
  min
end
p my_min_two(list)
# Time complexity O(n)

def largest_sum(list)
  sub_a=[]
  list.each_with_index do |el, i|
    subs = []
    idx = i
    while idx < list.length
      subs += [list[idx]]
      sub_a << subs
      idx += 1
    end
  end

  sums = sub_a.map do |sub|
    sub.reduce(:+)
  end

  sums.max
end

list_2 = [2, 3, -6, 7, -6, 7]
p largest_sum(list_2)
# Time complexity O(n^2)

def largest_sum_two(list)
  if list.all? { |el| el < 0 }
    return list.max
  end

  largest_sum = list.first
  current_sum = list.first

  i =1
  while i < list.length
    current_sum += list[i]
    if current_sum > largest_sum
      largest_sum = current_sum
    elsif current_sum  < 0
      current_sum = 0
    end
    i+=1
  end
  return largest_sum
end
p largest_sum_two(list_2)
p largest_sum_two([1, 2, -4, 4, -3, 4])
