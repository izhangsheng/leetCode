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
