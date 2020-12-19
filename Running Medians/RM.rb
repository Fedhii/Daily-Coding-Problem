# Heads up - more dubugging needed here

# Compute the running median of a sequence of numbers. That is, given a stream 
# of numbers, print out the median of the list so far on each new element.

# Recall that the median of an even-numbered list is the average of the two middle numbers.

# For example, given the sequence [2, 1, 5, 7, 2, 0, 5], your algorithm should print out:

# 2
# 1.5
# 2
# 3.5
# 2
# 2
# 2

class MinHeap
    # Implement a MinHeap using an array
    def initialize
        # Initialize arr with nil as first element
        # This dummy element makes it where first real element is at index 1
        # You can now divide i / 2 to find an element's parent
        # Elements' children are at i * 2 && (i * 2) + 1
        @elements = [nil]
    end
    
    def min
        @elements[1..-1].min
    end
    
    def insert(element)
        # push item onto end (bottom) of heap
        @elements.push(element)
        # then bubble it up until it's in the right spot
        bubble_up(@elements.length - 1)
    end
    
    def pop
        # swap the first and last elements
        @elements[1], @elements[@elements.length - 1] = @elements[@elements.length - 1], @elements[1]
        # Min element is now at end of arr (bottom of heap)
        min = @elements.pop
        # Now bubble the top element (previously the bottom element) down until it's in the correct spot
        bubble_down(1)
        # return the min element
        min
    end
    
    def length
        @elements.length - 1
    end
    
    def peek
        @elements[1]
    end
    
    def print
        @elements
    end

    def size
        @elements.length - 1
    end
    
    private
    
    def bubble_up(index)
        parent_i = index / 2
        # Done if you reach top element or parent is already smaller than child
        return if index <= 1 || @elements[parent_i] <= @elements[index]
        
        # Otherwise, swap parent & child, then continue bubbling
        @elements[parent_i], @elements[index] = @elements[index], @elements[parent_i]
        
        bubble_up(parent_i)
    end
    
    def bubble_down(index)
        child_i = index * 2
        return if child_i > @elements.size - 1
        
        # get largest child
        not_last = child_i < @elements.size - 1
        left = @elements[child_i]
        right = @elements[child_i + 1]
        child_i += 1 if not_last && right < left
        
        # stop if parent element is already less than children
        return if @elements[index] <= @elements[child_i]
        
        # otherwise, swap and continue
        @elements[index], @elements[child_i] = @elements[child_i], @elements[index]
        bubble_down(child_i)
    end
end

class MaxHeap  
  def initialize
    @heap = [nil]
  end

  def insert(item)
    @heap << item
    bubble_up(last_index)
    self
  end

  def pop
    max = @heap[1]
    swap(1, last_index)
    @heap.pop
    bubble_down(1)
    max
  end
  
  def size
    @heap.length - 1
  end

  def peek
    return @heap[1]
  end

  private

    def bubble_down(index)
    left_child_index = index * 2
    right_child_index = index * 2 + 1 
    
    # If left child is off the end of the array, then right is too
    return if left_child_index > last_index
    
    greater_child_index = determine_greater_child(left_child_index, right_child_index)
    
        
    if @heap[greater_child_index] > @heap[index] 
        swap(index, greater_child_index)
        # Keep moving that same element down as far as necessary
        # Note, lesser_child_index is now speaking of what was previously "index"
        bubble_down(greater_child_index)
    end
  end

  def determine_greater_child(left_child_index, right_child_index)
    # If right has run off the array, return left
    return left_child_index if right_child_index > last_index

    if @heap[left_child_index] > @heap[right_child_index]
      left_child_index
    else
      right_child_index
    end
  end
  
  def bubble_up(index)
    parent_index = index / 2

    return if parent_index.zero?

    child = @heap[index]
    parent = @heap[parent_index]
    
    if child > parent
        # We want greater values bubbled up, so check if the child is greater
        swap(index, parent_index)
        bubble_up(parent_index)
    end
  end
  
  def last_index
    @heap.length - 1
  end

  def swap(index_a, index_b)
    @heap[index_a], @heap[index_b] = @heap[index_b], @heap[index_a]
  end
end

def add_number(num, lowers, highers)
    if lowers.size == 0 || num < lowers.peek()
        lowers.insert(num)
    else
        highers.insert(num)
    end
end

def rebalance(lowers, highers)
    bigger_heap = lowers.size > highers.size ? lowers : highers
    smaller_heap = lowers.size > highers.size ? highers : lowers

    if bigger_heap.size - smaller_heap.size >= 2
        smaller_heap.insert(bigger_heap.pop)
    end
end

def get_median(lowers, highers)
    bigger_heap = lowers.size > highers.size ? lowers : highers
    smaller_heap = lowers.size > highers.size ? highers : lowers

    if bigger_heap.size == smaller_heap.size
        return (bigger_heap.size + smaller_heap.size).to_f / 2
    else
        return bigger_heap.peek()
    end
end

def get_running_medians(arr)
    lowers = MinHeap.new()
    highers = MaxHeap.new()
    medians = []

    arr.each_with_index do |num, idx|
        add_number(num, lowers, highers)
        rebalance(lowers, highers)
        medians[idx] = get_median(lowers, highers)
    end

    return medians
end

=begin

While more debugging is necessary, the idea is clear - at any given point in the
data stream, the median number is the the middle 1 or 2 numbers if it were sorted.
We could sort it and grab those two numbers, but a min and max heap allow us to do 
this faster. The min_heap should hold all of the larger elements in our array so far,
and the max_heap should hold all of the smaller elements. That way, the largest
from the lower half and the smallest from the upper half are easily accessible.

=end

arr = [2, 1, 5, 7, 2, 0, 5]
p get_running_medians(arr)

# 2
# 1.5
# 2
# 3.5
# 2
# 2
# 2

=begin
p max_heap.peek
max_heap.pop
p max_heap.peek
max_heap.pop
p max_heap.peek
max_heap.pop
p max_heap.peek
max_heap.pop
p max_heap.peek
max_heap.pop
p max_heap.peek
max_heap.pop
p max_heap.peek
max_heap.pop
=end