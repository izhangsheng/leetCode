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

//let nums = [10, 9, 2, 5, 3, 7, 101, 18]
//let subsequence = Subsequence()
//let a = subsequence.lengthOfLIS(nums)
//print(a)

//BinarySearch().search([1, 3], 3)



//Graph().findOrder1(4, [[1,0],[2,0],[3,1],[3,2]])


func testSort() {
    var arr = [Int]()
    let range = 0 ... 3000
    for _ in range {
        arr.append(Int.random(in: range))
    }
    
//        var arr = [1, 4, 2, 7, 5, 10, 8, 9, 3, 6, 8]
    
    selectionSort(arr: &arr)
    bubbleSort1(arr: &arr)
    bubbleSort2(arr: &arr)
    bubbleSort3(arr: &arr)
    heapSort(arr: &arr)
    insertionSort1(arr: &arr)
    insertionSort2(arr: &arr)
    insertionSort3(arr: &arr)
    mergeSort(arr: &arr)
    quickSort(arr: &arr)
    shellSort(arr: &arr)
    
    
    func selectionSort(arr: inout [Int]) {
        let sort = SelectionSort<Int>()
        sort.sort(withElements: &arr)
        print("selectionSort：\(sort.description)")
    }
    
    func bubbleSort1(arr: inout [Int]) {
        let sort = BubbleSort1<Int>()
        sort.sort(withElements: &arr)
        print("bubbleSort1：\(sort.description)")
    }
    
    func bubbleSort2(arr: inout [Int]) {
        let sort = BubbleSort1<Int>()
        sort.sort(withElements: &arr)
        print("bubbleSort2：\(sort.description)")
    }
    
    func bubbleSort3(arr: inout [Int]) {
        let sort = BubbleSort1<Int>()
        sort.sort(withElements: &arr)
        print("bubbleSort3：\(sort.description)")
    }
    
    func heapSort(arr: inout [Int]) {
        let sort = HeapSort<Int>()
        sort.sort(withElements: &arr)
        print("heapSort：\(sort.description)")
    }
    
    func insertionSort1(arr: inout [Int]) {
        let sort = InsertionSort1<Int>()
        sort.sort(withElements: &arr)
        print("insertionSort1：\(sort.description)")
    }
    
    func insertionSort2(arr: inout [Int]) {
        let sort = InsertionSort2<Int>()
        sort.sort(withElements: &arr)
        print("insertionSort2：\(sort.description)")
    }
    
    func insertionSort3(arr: inout [Int]) {
        let sort = InsertionSort3<Int>()
        sort.sort(withElements: &arr)
        print("insertionSort3：\(sort.description)")
    }
    
    func mergeSort(arr: inout [Int]) {
        let sort = MergeSort<Int>()
        sort.sort(withElements: &arr)
        print("mergeSort：\(sort.description)")
    }
    
    func quickSort(arr: inout [Int]) {
        let sort = QuickSort<Int>()
        sort.sort(withElements: &arr)
        print("quickSort：\(sort.description)")
    }
    
    func shellSort(arr: inout [Int]) {
        let sort = ShellSort<Int>()
        sort.sort(withElements: &arr)
        print("shellSort：\(sort.description)")
    }
}
