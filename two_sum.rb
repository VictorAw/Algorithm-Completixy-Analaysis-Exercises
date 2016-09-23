def brute_two_sum?(arr, sum)
  for i in 0...arr.size-1
    for j in i+1...arr.size
      return true if arr[i] + arr[j] == sum
    end
  end

  false
end

# 1 1 2 3 5 7 8 9 11 15 16  => 20
#

def sort_two_sum?(arr, sum)
  arr.sort!
  arr.each_with_index do |n, i|
    index = arr.bsearch_index { |x| x == sum-n }
    return true if index && index != i
  end

  false
end

def hash_two_sum?(arr, sum)
  hash = Hash.new(0)

  arr.each { |n| hash[n] += 1 }

  arr.each do |n|
    hash[n] -= 1
    return true if hash[sum-n] > 0
    hash[n] += 1
  end

  false
end
