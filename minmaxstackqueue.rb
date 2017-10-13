class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.unshift(el)
  end

  def dequeue
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MyStack

  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(el)
    @store.push(el)
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class StackQueue

  def initialize
    @enqueue = MyStack.new
    @dequeue = MyStack.new
  end

  def enqueue(el)
    @enqueue.push(el)
  end

  def dequeue
    if @dequeue.empty?
      until @enqueue.empty?
        @dequeue.push(@enqueue.pop)
      end
    end
    @dequeue.pop
  end

  def size
    @enqueue.size + @dequeue.size
  end

  def empty?
    @enqueue.empty? && @dequeue.empty?
  end
end

class MinMaxStack < MyStack
  def push(el)
    if self.empty?
      el_data = { value: el, max: el, min: el }
    else
      max = peek[:max]
      min = peek[:min]
      max = el if el > max
      min = el if el < min
      el_data = { value: el, max: max, min: min }
    end
    @store.push(el_data)
  end

  def max
    peek[:max]
  end

  def min
    peek[:min]
  end
end

class MinMaxStackQueue < StackQueue
  def initialize
    @enqueue = MinMaxStack.new
    @dequeue = MinMaxStack.new
  end

  def dequeue
    if @dequeue.empty?
      until @enqueue.empty?
        @dequeue.push(@enqueue.pop[:value])
      end
    end
    @dequeue.pop
  end

  def max
    return @enqueue.peek[:max] if @dequeue.empty?
    return @dequeue.peek[:max] if @enqueue.empty?

    if @dequeue.peek[:max] > @enqueue.peek[:max]
      @dequeue.peek[:max]
    else
      @enqueue.peek[:max]
    end
  end

  def min
    return @enqueue.peek[:min] if @dequeue.empty?
    return @dequeue.peek[:min] if @enqueue.empty?
    
    if @dequeue.peek[:min] > @enqueue.peek[:min]
      @dequeue.peek[:min]
    else
      @enqueue.peek[:min]
    end
  end
end
