//
//  TopK.swift
//  LeetCode
//
//  Created by 张胜 on 2021/2/28.
//

import Foundation

class TopK {
    func topK(elements: inout [Int], k: Int) -> [Int] {
        let heapSize = k
        var binaryHeap = Array(elements.prefix(heapSize))
        heapify(array: &binaryHeap)
        for i in heapSize ..< elements.count {
            let ele = elements[i]
            if binaryHeap[0] < ele {
                binaryHeap[0] = ele
                shiftDown(index: 0, array: &binaryHeap)
            }
        }
        return binaryHeap
    }
    
    private func heapify(array: inout [Int]) {
        var end = array.count >> 1 - 1
        while end >= 0 {
            shiftDown(index: end, array: &array)
            end -= 1
        }
    }
    
    private func shiftDown(index: Int, array: inout [Int]) {
        var curIdx = index
        // 记录元素，以供后续交换
        let value = array[index]
        // 第一个叶子节点的下标
        let firstLeafNodeIdx = array.count >> 1
        while curIdx < firstLeafNodeIdx {
            // 最小子节点下标默认左子树下标
            var minChildIdx = curIdx * 2 + 1
            var minChildEle = array[minChildIdx]
            let rightChildIdx = minChildIdx + 1
            if rightChildIdx < array.count, minChildEle > array[rightChildIdx] {
                minChildIdx = rightChildIdx // 找出左右孩子中最小的
                minChildEle = array[minChildIdx]
            }
            if value < array[minChildIdx] {
                break
            }
            // 把下滤位置的元素修改成左右孩子中最小的节点值（小顶堆）
            array[curIdx] = minChildEle
            curIdx = minChildIdx
        }
        array[curIdx] = value
    }
}
