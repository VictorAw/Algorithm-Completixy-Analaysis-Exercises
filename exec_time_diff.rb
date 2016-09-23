def my_min_slow(array)
  for i in 0...array.size - 1
    found = true
    for j in i+1...array.size
      if array[i] > array[j]
        found = false
        break
      end
    end
    next if !found
    return array[i]
  end
  nil
end

def my_min(array)
  min = 1.0/0
  array.each do |el|
    min = el if el < min
  end
  return min
end

#largest contiguous subsum
def lcs_slow(array)
  sub_arrays = []
  for i in 0...array.size
    sub_array = []
    sub_array << array[i]
    sub_arrays << sub_array.dup
    for j in i+1...array.size
      sub_array << array[j]
      sub_arrays << sub_array.dup
    end
  end
p sub_arrays

  sums = sub_arrays.map do |sub_array|
    sub_array.reduce(:+)
  end
  return sums.max
end

require "byebug"
def lcs(array)
  # debugger
  largest_total = -1.0/0
  current_total = 0
  previous_total = 0
  array.each do |el|
    # if current_lt_largest
    #   current_total = el
    # else
      current_total += el
    # end

    if largest_total > current_total
      previous_total = current_total
      current_total = el
    end

    if largest_total < current_total
      if previous_total + el > current_total
        current_total = previous_total + el
      end
      largest_total = current_total
    end
  end

  largest_total
end

p lcs([2, 3, -6, 7, -6, 7])
p lcs([-5, -1, -3])
p lcs([5, 3, -7])
