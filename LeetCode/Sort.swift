//
//  Sort.swift
//  LeetCode
//
//  Created by 张胜 on 2021/2/27.
//

import Foundation

class Sort {
    func bubbleSort(elements: inout [Int]) {
        var end = elements.count - 1
        while end > 0 {
            var sortedIdx = 0 // 记录最后已经排好序的下标
            var isSorted = true
            for i in 1 ... end {
                if elements[i] < elements[i - 1] {
                    let tmp = elements[i]
                    elements[i] = elements[i - 1]
                    elements[i - 1] = tmp
                    isSorted = false
                    sortedIdx = i
                }
            }
            if isSorted {
                break
            }
            end = sortedIdx
//            end -= 1
        }
    }
    
    func selectedSort(elements: inout [Int]) {
        var end = elements.count - 1
        while end > 0 {
            var maxIdx = 0
            for i in 1 ... end {
                if elements[maxIdx] < elements[i] {
                    maxIdx = i
                }
            }
            let tmp = elements[end]
            elements[end] = elements[maxIdx]
            elements[maxIdx] = tmp
            end -= 1
        }
    }
    func insertSort1(elements: inout [Int]) {
        let end = elements.count - 1
        
        for begin in 1 ... end {
            var curIdx = begin
            let ele = elements[curIdx]
            while curIdx > 0, ele < elements[curIdx - 1] {
                elements[curIdx] = elements[curIdx - 1]
                curIdx -= 1
            }
            elements[curIdx] = ele
        }
    }
    
    func insertSort2(elements: inout [Int]) {
        let end = elements.count - 1
        
        for begin in 1 ... end {
            var curIdx = begin
            let ele = elements[curIdx]
            let insertIdx = insertIndex(with: begin, elements: elements)
            while curIdx > insertIdx {
                elements[curIdx] = elements[curIdx - 1]
                curIdx -= 1
            }
            elements[insertIdx] = ele
        }
    }
    
    /// 利用二分搜索找到 idx 位置元素待插入的下标
    /// - Parameter idx: index
    private func insertIndex(with idx: Int, elements: [Int]) -> Int {
        var begin = 0
        var end = idx
        while end > begin {
            let middle = ((begin + end) >> 1)
            if elements[idx] < elements[middle] {
                end = middle
            } else {
                begin = middle + 1
            }
        }
        return begin
    }
    
    func heapSort(elements: inout [Int]) {
        heapify(elements: &elements)
        
        var heapSize = elements.count
        while heapSize > 1 {
            // 交换堆顶元素和尾部元素
            let tmp = elements[heapSize - 1]
            elements[heapSize - 1] = elements[0]
            elements[0] = tmp
            
            heapSize -= 1

            // 对0位置进行siftDown（恢复堆的性质）
            siftDown(index: 0, array: &elements, heapSize: heapSize)
        }
    }
    
    private func heapify(elements: inout [Int]) {
        var end = elements.count >> 1 - 1
        while end >= 0 {
            siftDown(index: end, array: &elements, heapSize: elements.count)
            end -= 1
        }
        print("")
    }
    
    /// 下滤操作
    /// - Parameters:
    ///   - index: 下滤的下标
    ///   - array: 数组
    ///   - heapSize: 堆大小
    private func siftDown(index: Int, array: inout [Int], heapSize: Int) {
        let half = heapSize >> 1
        var curIdx = index
        let ele = array[index]
        
        /// curIdx表示左右子树中最大的孩子的下标，如果curIdx小于half继续下滤
        while curIdx < half {
            let leftIdx = curIdx * 2 + 1
            var maxIdx = leftIdx
            let rightIdx = leftIdx + 1
            let leftEle = array[leftIdx]
            var maxEle = leftEle
            if rightIdx < heapSize, array[rightIdx] > leftEle {
                maxIdx = rightIdx
                maxEle = array[rightIdx]
            }
            if ele > maxEle {
                break
            }
            array[curIdx] = maxEle
            curIdx = maxIdx
        }
        array[curIdx] = ele
    }
    
    func quickSort(elements: inout [Int]) {
        quickSort(begin: 0, end: elements.count, elements: &elements)
    }
    
    private func quickSort(begin: Int, end: Int, elements: inout [Int]) {
        guard end > begin else {
            return
        }
        let pivotIdx = pivotIndex(begin: begin, end: end, elements: &elements)
        quickSort(begin: begin, end: pivotIdx, elements: &elements)
        quickSort(begin: pivotIdx + 1, end: end, elements: &elements)
    }
    
    private func pivotIndex(begin: Int, end: Int, elements: inout [Int]) -> Int {
        var left = begin
        var right = end - 1
        let pivotEle = elements[begin]
        
        while right > left {
            while right > left {
                if elements[right] > pivotEle {
                    right -= 1
                } else {
                    elements[left] = elements[right]
                    left += 1
                    break
                }
            }
            while right > left {
                if elements[left] < pivotEle {
                    left += 1
                } else {
                    elements[right] = elements[left]
                    right -= 1
                    break
                }
            }
        }
        elements[left] = pivotEle
        return left
    }
    
    func mergeSort(elements: [Int]) -> [Int] {
        let count = elements.count
        guard count > 1 else {
            return elements
        }
        let middle = count >> 1
        let left = Array(elements[0 ..< middle])
        let right = Array(elements[middle ..< count])
        return merge(left: mergeSort(elements: left), right: mergeSort(elements: right))
    }
    
    private func merge(left: [Int], right: [Int]) -> [Int] {
        var result = [Int]()
        var preArray = left
        var nextArray = right
        while !preArray.isEmpty, !nextArray.isEmpty {
            if preArray[0] <= nextArray[0] {
                result.append(preArray.remove(at: 0))
            } else {
                result.append(nextArray.remove(at: 0))
            }
        }
        if !preArray.isEmpty {
            result.append(contentsOf: preArray)
        }
        if !nextArray.isEmpty {
            result.append(contentsOf: nextArray)
        }
        return result
    }
}
