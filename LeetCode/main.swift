//
//  main.swift
//  LeetCode
//
//  Created by zhangsheng on 2021/2/26.
//

import Foundation

//NQueue().solveNQueues(8)

//var arr = [5, 2, 9, 8, 3, 20]
//
//var sortedArray = [2, 3, 5, 8, 9, 20]
//let sortCls = Sort()
//sortCls.bubbleSort(elements: &sortedArray)
//sortCls.selectedSort(elements: &arr)
//sortCls.insertSort1(elements: &arr)
//sortCls.heapSort(elements: &arr)

//let topKCls = TopK()
//var moreEles = [8, 45, 20, 10, 7, 23, 88, 90, 12, 3, 100, 20, 74, 15, 18]
//let topKCollection = topKCls.topK(elements: &moreEles, k: 5)

//print(sortCls.mergeSort(elements: arr))
//print(topKCollection)
//print(arr)

//sortCls.quickSort(elements: &arr)

//let temperatures = [73, 74, 75, 71, 69, 72, 76, 73]
//print(DailyTemperature().dailyTemperatures(temperatures))
//print(arr)

//print(ValidBracket().isValid("()"))

//let linkList1 = ListNode(1)
//let linkList2 = ListNode(1)
//let linkList3 = ListNode(2)
//let linkList4 = ListNode(1)
//linkList1.next = linkList2
//linkList2.next = linkList3
//linkList3.next = linkList4
//
//print(linkList1.isPalindrome(linkList1))

let nums = [10, 9, 2, 5, 3, 7, 101, 18]
let subsequence = Subsequence()
let a = subsequence.lengthOfLIS(nums)
print(a)

//BinarySearch().search([1, 3], 3)


func removeDuplicates(_ nums: inout [Int]) -> Int {
    let count = nums.count
    if count < 2 { return count }
    var slow = 0
    for i in 1 ..< count {
        if nums[i] != nums[slow] {
            slow += 1
            nums[slow] = nums[i]
        }
    }
    return slow +  1
}


func isValidBST(_ root: TreeNode?) -> Bool {
    guard let root = root else {
        return false
    }
    var isBst = true
    
    var preEle = -999999999999999
    var stack = [TreeNode]()
    var travelNode: TreeNode? = root
    while !stack.isEmpty || travelNode != nil {
        if let nodeOk = travelNode {
            stack.append(nodeOk)
            travelNode = nodeOk.left
        } else {
            let removeTop = stack.removeLast()
            if preEle > removeTop.val {
                isBst = false
                break
            }
            preEle = removeTop.val
            travelNode = removeTop.right
        }
    }
    
    return isBst
}



func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    guard nums.count >= k else {
        return [Int]()
    }
    
    var deque = [Int]()
    var result = [Int]()
        
    for i in 0 ..< nums.count {
        // 0位置是队头
        while !deque.isEmpty, nums[i] >= nums[deque.last!] {
            deque.removeLast()
        }
        
        // 入队
        deque.append(i)
        
        // 判断当前队列中队首的值是否有效
        if deque[0] <= i - k {
            deque.removeFirst()
        }
        
        // 当窗口长度为k时 保存当前窗口中最大值
        if i + 1 >= k {
            result.append(nums[deque[0]])
        }
    }
    
    return result
}


func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var result = [Int]()
    var stop = false
    for i in 0 ..< nums.count {
        for j in i ..< nums.count {
            if nums[i] + nums[j] == target {
                result.append(i)
                result.append(j)
                stop = true
            }
        }
        if stop {
            break
        }
    }
    return result
}

func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    var result = [Int]()
    var dic = Dictionary<Int, Int>()
    
    for i in 0 ..< nums.count {
        let another = target - nums[i]
        if dic.values.contains(another) {
            result.append(i)
            for key in dic.keys {
                if dic[key] == another {
                    result.append(key)
                    break
                }
            }
        }
        if !result.isEmpty {
            break
        }
        dic.updateValue(nums[i], forKey: i)
    }
    return result
}

/**
 给你一个整数数组 nums 和一个整数 k ，请你返回其中出现频率前 k 高的元素。你可以按 任意顺序 返回答案。
 */
func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    let count = nums.count
    var result = [Int]()
    guard k > 0 else {
        return result
    }
    guard !nums.isEmpty else {
        return result
    }
    
    guard count > 1 else {
        if k == 1 {
            return [1]
        } else {
            return result
        }
    }
    var slow = 0
    var fast = 1
    
    var isAllEqual = true
    while fast < count {
        if nums[fast] != nums[slow] {
            if fast - slow >= k {
                result.append(nums[slow])
            }
            slow = fast
            isAllEqual = false
        }
        fast += 1
    }
    
    if isAllEqual {
        if nums.count >= k {
            result.append(nums[0])
        }
    }
    return result
}
