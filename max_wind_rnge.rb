def max_wnd_rnge_slow(arr, w)
  current_max_range = -1.0/0
  (0..arr.size-w).each do |i|
    slice = arr[i..i+w-1]
    max = slice.max
    min = slice.min
    current_max_range = max - min if max-min > current_max_range
  end
  current_max_range
end

require_relative "StackQueue.rb"

def max_wind_rnge(arr, w)
  current_max_range = -1.0/0
  window = StackQueue.new
  arr_slice = arr[0...w]
  arr_slice.each do |n|
    window.enqueue(n)
  end
  current_max_range = window.max - window.min

  (w...arr.size).each do |i|
    window.dequeue
    window.enqueue(arr[i])
    max = window.max
    min = window.min
    current_max_range = max-min if current_max_range < max-min
  end

  current_max_range
end
require "byebug"
if __FILE__ == $PROGRAM_NAME
  p max_wind_rnge([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
  p max_wind_rnge([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
  p max_wind_rnge([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
  p max_wind_rnge([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8
end
