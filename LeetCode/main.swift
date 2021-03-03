//
//  main.swift
//  LeetCode
//
//  Created by zhangsheng on 2021/2/26.
//

import Foundation

//NQueue().solveNQueues(8)

findWrongNode()
func findWrongNode() {
//    if (prev != null && prev.val > node.val) {
//        // 第2个错误节点：最后一个逆序对中较小的那个节点
//        second = node;
//
//        // 第1个错误节点：第一个逆序对中较大的那个节点
//        if (first != null) return;
//        first = prev;
//    }
//    prev = node;
    var arr = [9, 25, 6, 12, 8, 6]
    
    
    func sort(elements: inout [Int]) {
        quickSort(elements: &elements, begin: 0, end: elements.count)
    }
    
    func quickSort(elements: inout [Int], begin: Int, end: Int) {
        guard end - begin > 1 else {
            return
        }
        let pivot = pivotIndex(sortArray: &elements, begin: begin, end: end)
        quickSort(elements: &elements, begin: begin, end: pivot)
        quickSort(elements: &elements, begin: pivot + 1, end: end)
    }
    
    func pivotIndex(sortArray: inout [Int], begin: Int, end: Int) -> Int {
        let pivotEle = sortArray[begin]
        var left = begin
        var right = end - 1
        while right > left {
            while right > left {
                if sortArray[right] > pivotEle {
                    right -= 1
                } else {
                    sortArray[left] = sortArray[right]
                    left += 1
                    break
                }
            }
            while right > left {
                if sortArray[left] < pivotEle {
                    left += 1
                } else {
                    sortArray[right] = sortArray[left]
                    right -= 1
                    break
                }
            }
        }
        sortArray[left] = pivotEle
        return left
    }
    sort(elements: &arr)
    print(arr)
}

