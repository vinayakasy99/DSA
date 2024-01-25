//
//  Arrays.swift
//  Practice
//
//  Created by Vinayaka S Yattinahalli on 25/01/24.
//
import UIKit

class Arrays: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var arr = [0,1,2,3,4,5,6]
//        let resultsArray = self.threeNumberSum(array: &arr, targetSum: 6)
        //        print(resultsArray)
        
        var arr1 = [-1, 5, 10, 20, 28, 3]
        var arr2 = [26, 134, 135, 15, 17]
//        let smallestDifference = smallestDifference(arrayOne: &arr1, arrayTwo: &arr2)
        //        print(smallestDifference)
        
        var arr3 = [3,2,3,4]
        let finalArray = moveElementToEnd(&arr3, 3)
        //        print(finalArray)
        var monotonicArray = [0,-1,-2,-3]
//        let isMonotonic = self.isMonotonic(array: monotonicArray)
//        print(isMonotonic)
        
        let inputArray = [[1,2,3],[8,9,4],[7,6,5]]
        let spiralArray = spiralTraverse(array: inputArray)
        print(spiralArray)
    }
    
    func threeNumberSum(array: inout [Int], targetSum: Int) -> [[Int]] {
        var resultArray = [[Int]]()
        let sortedArray = array.sorted(by: <)
        var left = 0
        var right = array.count - 1
        for i in 0..<sortedArray.count-2 {
            left = i+1
            right = sortedArray.count - 1
            while left < right {
                let currentSum = sortedArray[i] + sortedArray[left] + sortedArray[right]
                if currentSum == targetSum {
                    resultArray.append([sortedArray[i],sortedArray[left],sortedArray[right]])
                    left += 1
                    right -= 1
                } else {
                    if currentSum < targetSum {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
        }
        return resultArray
    }
    
    func smallestDifference(arrayOne: inout [Int], arrayTwo: inout [Int]) -> [Int] {
        // Write your code here.
        var res = [arrayOne[0],arrayTwo[0]]
        var smallesDiff = abs(arrayOne[0] - arrayTwo[0])
        
        for i in 0..<arrayOne.count {
            for j in 0..<arrayTwo.count {
                let diff = abs(arrayOne[i] - arrayTwo[j])
                if diff < smallesDiff {
                    smallesDiff = diff
                    res[0] = arrayOne[i]
                    res[1] = arrayTwo[j]
                }
            }
        }
        return res
    }
    
    func moveElementToEnd(_ array: inout [Int], _ toMove: Int) -> [Int] {
        var lP = 0
        var rP = array.count - 1
        
        while lP <= rP {
            //            print("before = ",lP,rP)
            if array[lP] != toMove {
                lP+=1
                continue
            }
            if array[rP] == toMove {
                rP-=1
                continue
            }
            //            print("after = ",lP,rP)
            array.swapAt(lP,rP)
            lP+=1
            rP-=1
            //            print("after 2 = ",lP,rP)
        }
        return array
    }
    
    func isMonotonic(array: [Int]) -> Bool {
        // Write your code here.
        if array.count <= 2 {
            return true
        }
        var up = true
        var down = true
        // 0, -1, 2, -3
        for i in 1..<array.count {
            print("value of i is \(i) and  array[i] is \(array[i])")
            print("value of i-1 is \(i-1) and  array[i] is \(array[i-1])")
            if array[i] > array[i-1] {
                
                down = false
            }
            if array[i] < array[i-1] {
                up = false
            }
        }
        return up || down
    }
    
    func spiralTraverse(array: [[Int]]) -> [Int] {
        if array.count == 0 {
            return []
        }
        var result = [Int]()
        var startRow = 0
        var endRow = array.count - 1
        var startCol = 0
        var endCol = array[0].count - 1
        
        while startRow <= endRow && startCol <= endCol {
            
            for col in startCol..<endCol+1 {
                result.append(array[startRow][col])
            }
            
            for row in startRow+1..<endRow+1 {
                result.append(array[row][endCol])
            }
            
            if startRow == endRow || startCol == endCol {
                break
            }
            
            for col in stride(from: endCol-1, through: startCol, by: -1) {
                result.append(array[endRow][col])
            }
            
            for row in stride(from: endRow-1, through: startRow+1, by: -1) {
                result.append(array[row][startCol])
            }
            
            
            startRow += 1
            startCol += 1
            endCol -= 1
            endRow -= 1
            
        }
        
        return result
    }
}

