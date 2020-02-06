import StatsBase.sample
using PyPlot

function heapsort(array::Vector)

    array_copy = copy(array) # create copy

    heapsort!(array_copy, length(array_copy)) # sort copy inplace

    return array_copy

end


function heapsort!(array::Vector, count::Int)

    # Build the heap in array a so that largest value is at the root
    heapify!(array, count)

    #The following loop maintains the invariants that a[0:end] is a heap and every element
    # beyond end is greater than everything before it (so a[end:count] is in sorted order))
    #end ← count - 1

    end_ = count
    while end_ > 0
        #a[0] is the root and largest value. The swap moves it in front of the sorted elements.)
        #swap(a[end], a[0])

        tmp = array[end] # swap(a[end], a[0])
        array[end] = array[1]
        array[1] = tmp

        #the heap size is reduced by one)
        end_ =  end_ - 1

        #the swap ruined the heap property, so restore it)
        siftDown(a, 0, end_)

    end

end


# Put elements of 'a' in heap order, in-place
function heapify(array::Vector, count::Int64)
    #start is assigned the index in 'a' of the last parent node)
    #the last element in a 0-based array is at index count-1; find the parent of that element)

    start = idx_parent(count)

    while start >= 0

        println(start)
        println(array)
        #sift down the node at index 'start' to the proper place such that all nodes below
        # the start index are in heap order)
        siftDown(array, start, count-1)
        println(array)
        println("---")
        #go to the next parent node)
        start = start - 1
    #after sifting down the root all nodes/elements are in heap order)
    end

end


#Repair the heap whose root element is at index 'start', assuming the heaps rooted at its children are valid)
function siftDown(array::Vector, start::Int64, end_::Int64)
    root = start

    while idx_leftchild(root) <= end_ #    (While the root has at least one child)

        child = idx_leftchild(root)   #(Left child of root)
        swap = root                #(Keeps track of child to swap with)

        println(child)
        println(swap)

        if array[swap] < array[child]; swap = child; end

        #If there is a right child and that child is greater)
        if child+1 <= end_ && array[swap] < array[child+1]; swap = child + 1; end

        if swap == root
            #The root holds the largest element. Since we assume the heaps rooted at the
            # children are valid, this means that we are done.)
            return
        else

            tmp = array[swap] # swap(a[root], a[swap])
            array[swap] = array[root]
            array[root] = tmp


            root = swap            #(repeat to continue sifting down the child now)
        end
    end

end

# help functions to calc ide for parents and children in the heap vector
idx_parent(i)     = div(i,2) #where floor functions map a real number to the smallest leading integer.
idx_leftchild(i)  = 2*i
idx_rightchild(i) = 2*i + 1



x = sample(1:100, 5, replace = false)

div(5,2)

idx_parent(5)
idx_leftchild(5)
idx_rightchild(5)


x

swap!(x, 1,3)

x

x = sample(1:10, 10, replace = true)

x = rand(11)

iRightChild(5)

heapify(x, 5)


siftDown(array, start, count-1)



start = idx_parent(5)

x
siftDown(x, 2, 4)


function heapify(a,count) #is
    #(end is assigned the index of the first (left) child of the root)
    end_ = 2

    while end_ < count
        #(sift up the node at index end to the proper place such that all nodes above
         #the end index are in heap order)
        siftUp(a, 1, end_)
        end_ = end_ + 1
    end
    #(after sifting up the last node all nodes are in heap order)

end

function siftUp(a, start, end_)
    #input:  start represents the limit of how far up the heap to sift.
    #              end is the node to sift up.
    child = end_
    while child > start
        parent = idx_parent(child)
        if a[parent] < a[child] #then (out of max-heap order)
            #swap(a[parent], a[child])
            tmp = a[parent] # swap(a[root], a[swap])
            a[parent] = a[child]
            a[child] = tmp

            child = parent #(repeat to continue sifting up the parent now)
        else
            return
        end
    end
end

idx_parent(i)     = div(i,2) #where floor functions map a real number to the smallest leading integer.
idx_leftchild(i)  = 2*i
idx_rightchild(i) = 2*i + 1

x = sample(1:100, 5, replace = false)

x = rand(10)

#x = [40 30 20 25 15]

x = [30; 40; 20; 15; 25]

heapify(x, 5)

x

siftUp(x, 1, 1)
