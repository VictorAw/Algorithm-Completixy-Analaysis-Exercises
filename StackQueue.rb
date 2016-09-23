require_relative "MyStack"

# |3| | |
# |2| | |
# |1| | |
#
# |4| | |
# | | |2|
# | | |3|

class StackQueue
  def initialize
    @pop_store = MyStack.new
    @push_store = MyStack.new
  end

  def enqueue(val)
    @push_store.push(val)
  end

  def dequeue
    return @pop_store.pop unless @pop_store.empty?

    shift_stores
    @pop_store.pop
  end

  def max
    push_max = @push_store.max
    pop_max = @pop_store.max

    return push_max if @pop_store.empty?
    return pop_max if @push_store.empty?
    pop_max > push_max ? pop_max : push_max
  end

  def min
      push_min = @push_store.min
      pop_min = @pop_store.min

      return push_min if @pop_store.empty?
      return pop_min if @push_store.empty?
      pop_min < push_min ? pop_min : push_min
  end

  def peek
    return @pop_store.peek unless @pop_store.empty?

    shift_stores
    @pop_store.peek
  end

  def size
    @pop_store.size + @push_store.size
  end

  def empty?
    @pop_store.empty? && @push_store.empty?
  end

  def shift_stores
    until @push_store.empty?
      @pop_store.push(@push_store.pop)
    end
  end
end
