//
//  main.swift
//  LeetCode
//
//  Created by zhangsheng on 2021/2/26.
//

import Foundation

//NQueue().solveNQueues(8)

var arr = [5, 2, 9, 8, 3, 20]

var sortedArray = [2, 3, 5, 8, 9, 20]
let sortCls = Sort()
//sortCls.bubbleSort(elements: &sortedArray)
//sortCls.selectedSort(elements: &arr)
//sortCls.insertSort1(elements: &arr)
//sortCls.heapSort(elements: &arr)

//let topKCls = TopK()
//var moreEles = [8, 45, 20, 10, 7, 23, 88, 90, 12, 3, 100, 20, 74, 15, 18]
//let topKCollection = topKCls.topK(elements: &moreEles, k: 5)

print(sortCls.mergeSort(elements: arr))
//print(topKCollection)
//print(arr)

sortCls.quickSort(elements: &arr)

print(arr)

