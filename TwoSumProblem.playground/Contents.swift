import UIKit

// Return a Boolean if there are 2 numbers in the array that equal a sum
let nums = [1,3,6,7,7,12,14]

// 1- Brute Force - Nested For-loop compare all O(n^2)

func bruteForceTwoSum(array: [Int], sum: Int) -> Bool {
    
    for i in 0..<array.count {
        for j in 0..<array.count where j != i {
            if array[j] + array[i] == sum {
                print("True: \(array[i]) + \(array[j])")
                return true
            } else {
                print("False: \(array[i]) + \(array[j])")
            }
        }
    }
    
    return false
}
//bruteForceTwoSum(array: nums, sum: 23)

// 2- Binary Search Solution Compare O(n Log n) because it's sorted
let nums2 = [1,3,6,7,7,12,14]

func twoSumBinarySearch(array: [Int], sum: Int) -> Bool {
    
    guard array.count != 0 else {
        return false
    }
    
    for i in 0..<array.count {
        let compliment = sum - array[i]
        
        var tempArray = array
        tempArray.remove(at: i)
        let hasCompliment = binarySearch(array: tempArray, key: compliment)
        print("num: \(array[i]) - \(hasCompliment)")
        
        if hasCompliment == true {
            print("True - num: \(array[i]), compliment: \(compliment)")
            return true
        }
    }
    
    return false
}

//twoSumBinarySearch(array: nums2, sum: 4)




//3- Move Pointer from Either Ends - Linear O(n)

let nums3 = [1,3,6,7,7,12,14]
func twoSumPointers(array: [Int], sum: Int) -> Bool {
    var lowIndex = 0
    var highIndex = array.count - 1
    
    while lowIndex < highIndex {
        let sumOfItems = array[lowIndex] + array[highIndex]
        if sumOfItems == sum {
            print("Sum of \(array[lowIndex]) and \(array[highIndex]) = \(sum)")
            return true
        } else if sumOfItems < sum {
            lowIndex += 1
        } else if sumOfItems > sum {
            highIndex -= 1
        }
    }
    
    
    print("Pointers have crossed")
    return false
}

twoSumPointers(array: nums3, sum: 4)






func binarySearch(array: [Int], key: Int) -> Bool {
    guard array.count != 0 else { return false}
    
    let minIndex = 0
    let maxIndex = array.count - 1
    let midIndex = maxIndex / 2
    let midValue = array[midIndex]
    
    if key < array[minIndex] || key > array[maxIndex] {
//        print("\(key) is not in the array")
        return false
    }
    
    if key > midValue {
        let slice = Array(array[midIndex + 1...maxIndex])
        return binarySearch(array: slice, key: key)
    }
    
    if key < midValue {
        let slice = Array(array[minIndex...midIndex - 1])
        return binarySearch(array: slice, key: key)
    }
    
    if key == midValue {
        print("\(key) found in the array")
        return true
    }
    
    return false
}
