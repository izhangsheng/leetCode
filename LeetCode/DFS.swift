//
//  DFS.swift
//  LeetCode
//
//  Created by zhangsheng on 2021/5/24.
//

import Foundation

class Dfs {
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

    /**
     给定一个不含重复数字的数组 nums ，返回其 所有可能的全排列 。你可以 按任意顺序 返回答案。
     输入：nums = [1,2,3]
     输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
     */
    public func permute(_ nums: [Int]) -> [[Int]] {
        var paths = [[Int]]()
        
        backtrace(nums, path: [Int](), paths: &paths)
        
        return paths
    }
    
    private func backtrace(_ nums: [Int], path: [Int], paths: inout [[Int]]) {
        var selPath = path
        
        if selPath.count == nums.count {
            paths.append(selPath)
            return
        }
        for i in 0 ..< nums.count {
            if selPath.contains(nums[i]) {
                continue
            }
            selPath.append(nums[i])
            backtrace(nums, path: selPath, paths: &paths)
            selPath.removeLast()
        }
    }
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard !board.isEmpty, !word.isEmpty else {
            return false
        }
        var mBoard = board
        let m = board.count
        let n = board[0].count
        let characters = Array(word)
        for i in 0 ..< m {
            for j in 0 ..< n {
                if board[i][j] == characters[0] {
                    if dfs(&mBoard, characters, i, j, 0) { return true }
                }
            }
        }
        
        return false
    }
    
    @discardableResult private func dfs(_ board: inout [[Character]], _ cs: [Character], _ row: Int, _ column: Int, _ k: Int) -> Bool {
        if k == cs.count {
            return true
        }
        
        if row < 0 || column < 0 || row >= board.count || column >= board[row].count {
            return false
        }
        
        guard cs[k] == board[row][column] else {
            return false
        }
        let t = board[row][column]
        board[row][column] = Character("0")
        let res = dfs(&board, cs, row - 1, column, k + 1) ||
                dfs(&board, cs, row, column - 1, k + 1) ||
                dfs(&board, cs, row + 1, column, k + 1) ||
                dfs(&board, cs, row, column + 1, k + 1)
        
        board[row][column] = t
        return res
    }
}
