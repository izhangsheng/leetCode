//
//  NQueue.swift
//  LeetCode
//
//  Created by zhangsheng on 2021/2/26.
//

import Foundation

class NQueue {
    // 下标为列号，元素为是否摆放了皇后
    private var queues = [Bool]()
    private var leftTop = [Bool]()
    private var rightTop = [Bool]()
    private var result = [[String]]()
    private var place = 0
    // 下标为行号，元素为列号，表示在row行col列摆放了皇后
    private var cols = [Int]()
    
    
    func solveNQueues(_ n: Int) -> [[String]] {
        leftTop = Array(repeating: false, count: 2 * n - 1)
        rightTop = Array(repeating: false, count: 2 * n - 1)
        queues = Array(repeating: false, count: n)
        cols = Array(repeating: -1, count: n)
        placeQueue(row: 0, n: n)
        return result
    }
    
    private func placeQueue(row: Int, n: Int) {
        if row == n {
            place += 1
            appendBoard(n: n)
            return
        }
        for col in 0 ..< n {
            let leftTopIdx = col - row + n - 1
            if leftTop[leftTopIdx] {
                continue
            }
            let rightTopIdx = col + row
            if rightTop[rightTopIdx] {
                continue
            }
            if queues[col] {
                continue
            }
            leftTop[leftTopIdx] = true
            rightTop[rightTopIdx] = true
            queues[col] = true
            cols[row] = col
            placeQueue(row: row + 1, n: n)
            leftTop[leftTopIdx] = false
            rightTop[rightTopIdx] = false
            queues[col] = false
            cols[row] = -1;
        }
    }
    
    private func appendBoard(n: Int) {
        var resPlace = [String]()
        for i in 0 ..< n {
            var place = ""
            let idx = cols[i]
            for j in 0 ..< n {
                if j == idx {
                    place.append("Q")
                } else {
                    place.append(".")
                }
            }
            resPlace.append(place)
        }
        result.append(resPlace)
    }
}
