# 3 5 7 1 9 2 3
#
# [3 9 1]
# [2 9 1]
# [9 9 1]
# [1 7 1]
# [7 7 3]
# [5 5 3]
# [3 3 3]

class MyStack
  def initialize
    @store = []
    @max_store = []
    @min_store = []
  end

  def pop
    @max_store.pop
    @min_store.pop
    @store.pop
  end

  def push(val)
    val_max = max
    val_min = min
    val_max = val if val_max.nil? || val > val_max
    val_min = val if val_min.nil? || val < val_min

    @max_store << val_max
    @min_store << val_min
    @store << val
  end

  def max
    @max_store[-1]
  end

  def min
    @min_store[-1]
  end

  def peek
    @store[-1]
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end
