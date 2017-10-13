
def max_window_range(arr, window_size)
  current_max_range = nil

  (arr.length - window_size + 1).times do |idx|
    window = arr[idx...idx + window_size]
    range = window.max - window.min
    if current_max_range.nil? || range > current_max_range
      current_max_range = range
    end
  end

  current_max_range
end

p max_window_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p max_window_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p max_window_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p max_window_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
