class MyQueue

  def initialize
    @store = []
  end

  def enqueue(val)
    @store << val
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.drop(1)
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

end
