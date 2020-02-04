import StatsBase.sample
using PyPlot

# QuickSort method that creates a copy of the array and sortes and returns that copy
function quicksort(array::Vector)

    array_copy = copy(array) # create copy

    quicksort!(array_copy, 1, length(array)) # sort copt inplace

    return array_copy

end

# quicksort help function
function quicksort!(array::Vector, lo::Int64, hi::Int64)
    if lo < hi
        p = partition!(array, lo, hi) # find partitio value
        quicksort!(array, lo, p-1) # sort array left of pivot
        quicksort!(array, p+1, hi) # sort array right of pivot
    end
end

# help function to find partitio value
function partition!(array::Vector, lo::Int64, hi::Int64)
    pivot = array[hi] # pivot value is last element (Lomuto partition scheme)
    i = lo
    for j in lo:hi
        if array[j] < pivot
            # todo inplacment swap
            tmp = array[j] # swap array[j] and array[i]
            array[j] = array[i]
            array[i] = tmp
            #swap!(array, i, j)
            i = i + 1
        end
    end

    # todo inplacment operation
    tmp = array[i] # swap array[i] and array[hi]
    array[i] = array[hi]
    array[hi] = tmp

    #swap!(array, i, hi)

    return i

end

function swap!(array::Vector, x::Int64, y::Int64)

    array[x] = array[x] + array[y]
    array[y] = array[x] - array[y]
    array[x] = array[x] - array[y]

end


# todo get implacemnt swap to work...

x = sample(1:100, 5, replace = false)


x

swap!(x, 1,3)

x

x = sample(1:10, 10, replace = true)

x = rand(11)


x_sorted_sort = sort(x; alg = QuickSort)

x_sorted_quick_sort = quicksort(x)
