import StatsBase.sample
using PyPlot

# Merge Sort using the top-down implementation, i.e. we recursively divide the
# unsorted array until each part can be easliy sorted. Implemented for arrays (vectors).
function merge_sort(unsorted_array::Vector)

    # Base case
    if length(unsorted_array) <= 1
        return unsorted_array
    end

    # Divide array into left/right subarrays
    left_array = unsorted_array[1:div(length(unsorted_array),2)]
    right_array = unsorted_array[div(length(unsorted_array),2)+1:end]

    # Recursively sort both subarrays.
    left_array = merge_sort(left_array)
    right_array = merge_sort(right_array)

    # Merge the sorted subarrays.
    return merge_arrays(left_array, right_array)

end


# help function for merge sort that merges  two arrays
function merge_arrays(left_array::Vector, right_array::Vector)

    res = similar(left_array, length(left_array) + length(right_array)) # pre-allocate the res array

    idx = 1 # index for adding the values after each other in acending order

    while length(left_array) > 0 && length(right_array) > 0  # add the elemeents into res from the both subarrays in asending order
        if left_array[1] <= right_array[1]
            res[idx] = left_array[1] # add value to res
            left_array = remove_val(left_array, left_array[1]) # remove added value from the array
        else
            res[idx] = right_array[1]
            right_array = remove_val(right_array, right_array[1])
        end
        idx = idx+1 # update index
    end

    # Add in elements in the subarrays that are left
    while length(left_array) > 0
        res[idx] = left_array[1]
        left_array = remove_val(left_array, left_array[1])
        idx = idx+1
    end

    while length(right_array) > 0
        res[idx] = right_array[1]
        right_array = remove_val(right_array, right_array[1])
        idx = idx+1 
    end

    # return merged array res
    return res

end

# help function for merge stort. Removes the value val from the array array
function remove_val(array::Vector, val::Real)

    new_array = similar(array, length(array)-1) # pre-allocate new array

    idx = 1 # idx for adding values not equal to val
    for i in 1:length(array)

        if array[i] != val # add value to new_array if the value is not val
            new_array[idx] = array[i]
            idx = idx + 1
        end

    end

    return new_array

end


# test some cases
x = sample(1:100, 6, replace = false)

x = sample(1:10, 6, replace = true)

x = rand(11)

x_sorted_sort = sort(x)

x_sorted_merge_sort = merge_sort(x)


function test_run_time()


    N = [2,10,50,100,200,300,500,1000,10000, 100000]

    run_time_sort = zeros(length(N))
    run_time_merge_sort  = zeros(length(N))

    for i in 1:length(N)

        x = sample(1:1000, N[i], replace = true)

        run_time_sort[i] = @elapsed sort(x)
        run_time_merge_sort[i] = @elapsed sort(x)


    end

    return N, run_time_sort, run_time_merge_sort


end


N,run_time_sort, run_time_merge_sort = test_run_time()


PyPlot.figure()
PyPlot.plot(N, run_time_sort, "r")
PyPlot.plot(N, run_time_merge_sort, "g")
