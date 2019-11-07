#this is a comment
"""
multiline comment
"""
def binarySearch(array_2_check, left_size, right_size, element):
     while left_size <= right_size:

         mid = left_size + (right_size - left_size)//2

         if array_2_check[mid] == element:
             return mid
        
         elif array_2_check[mid] > element:
             right_size = mid -1

         else:
             left_size = mid + 1

def mergeSort(array_2_sort):
    if len(array_2_sort) > 1:
        mid = len(array_2_sort)//2
        left = array_2_sort[:mid]
        right = array_2_sort[mid:]

        mergeSort(left)
        mergeSort(right)
    
        i = j = k = 0

        while i < len(left) and j < len(right):
            if(left[i] < right[j]):
                array_2_sort[k] = left[i]
                i += 1
            else:
                array_2_sort[k] = right[j]
                j += 1
            k += 1
        
        while i < len(left):
            array_2_sort[k]=left[i]
            i = i + 1
            k = k + 1

        while j < len(right):
            array_2_sort[k] = right[j]
            j = j + 1
            k = k + 1

    print("Merging ",array_2_sort)
    

array = [10, 5, 8, 2 ,1, 3, 9, 45, 23, 102, 6, 99]
lmnt = 10

print(array)
mergeSort(array)
print(array)

result = binarySearch(array, 0, len(array)-1, lmnt)
  
if result != -1: 
    print ("Element is present at index % d" % result)
else: 
    print ("Element is not present in array")