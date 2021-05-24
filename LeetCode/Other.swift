//
//  Other.swift
//  LeetCode
//
//  Created by zhangsheng on 2021/5/24.
//

import Foundation

class Other {
    
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
    
    /// 每日温度 请根据每日 气温列表，重新生成一个列表。对应位置的输出为：要想观测到更高的气温，至少需要等待的天数。如果气温在这之后都不会升高，请在该位置用 0 来代替。
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        let length = T.count
        
        guard length > 1 else {
            return [0]
        }
        var ascentList = Array(repeating: 0, count: length)
        var stack = [0]
        for i in 1 ..< length {
            let curEle = T[i]
            while !stack.isEmpty, curEle > T[stack.last!] {
                let preIdx = stack.removeLast()
                ascentList[preIdx] = i - preIdx
            }
            stack.append(i)
        }
        
        return ascentList
    }
    
    public func isValid(_ s: String) -> Bool {
        guard !s.isEmpty else {
            return false
        }
        
        guard s.count % 2 == 0 else {
            return false
        }
        
        var stack = [Character]()
        for c in s {
            if c == "[" || c == "(" || c == "{" {
                stack.append(c)
            } else {
                if stack.isEmpty {
                    return false
                } else {
                    let left = stack.removeLast()
                    if left == "(", c != ")" { return false }
                    if left == "[", c != "]" { return false }
                    if left == "{", c != "}" { return false }
                }
            }
        }
        
        return stack.isEmpty
    }
    
    /**
     爬楼梯
     */
    func climbStairs(_ n: Int) -> Int {
        if n == 0 {
            return 0
        } else if n == 1 {
            return 1
        } else if n == 2 {
            return 2
        }
        var one = 1
        var two = 2
        var current = 0
        for _ in 3 ... n {
            current = one + two
            one = two
            two = current
        }
        return current
    }
    
    /*!
     螺旋矩阵
     
     给你一个 m 行 n 列的矩阵 matrix ，请按照 顺时针螺旋顺序 ，返回矩阵中的所有元素。
     示例 1：
     输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
     输出：[1,2,3,6,9,8,7,4,5]

     */
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let rows = matrix.count
        guard rows > 0 else {
            return []
        }
        
        let columns = matrix[0].count
        guard columns > 0 else {
            return []
        }
        
        var left = 0
        var right = columns - 1
        var top = 0
        var bottom = rows - 1
        var list = [Int]()
        while left <= right, top <= bottom {
            for i in left ... right {
                list.append(matrix[top][i])
            }
            
            if top < bottom {
                for j in top + 1 ... bottom {
                    list.append(matrix[j][right])
                }
            }

            if left < right, top < bottom {
                for m in (left ..< right).reversed() {
                    list.append(matrix[bottom][m])
                }
                for n in (top + 1 ..< bottom).reversed() {
                    list.append(matrix[n][left])
                }
            }
            
            left += 1
            right -= 1
            top += 1
            bottom -= 1
        }
        
        return list
    }
    
    func generateMatrix(_ n: Int) -> [[Int]] {
        var res = Array(repeating: Array(repeating: 0, count: n), count: n)
        var up = 0
        var down = n - 1
        var left = 0
        var right = n - 1
        var index = 1
        while index <= n * n {
            if index > n * n { break }
            for i in left ... right {
                res[up][i] = index
                index += 1
            }
            up += 1
            
            if index > n * n { break }
            for j in up ... down {
                res[j][right] = index
                index += 1
            }
            right -= 1
            
            if index > n * n { break }
            for m in (left ... right).reversed() {
                res[down][m] = index
                index += 1
            }
            down -= 1
            
            if index > n * n { break }
            for k in (up ... down).reversed() {
                res[k][left] = index
                index += 1
            }
            left += 1
        }
        return res
    }
    
    /*!
     整数数组 nums 按升序排列，数组中的值 互不相同 。

     在传递给函数之前，nums 在预先未知的某个下标 k（0 <= k < nums.length）上进行了 旋转，使数组变为 [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]（下标 从 0 开始 计数）。例如， [0,1,2,4,5,6,7] 在下标 3 处经旋转后可能变为 [4,5,6,7,0,1,2] 。

     给你 旋转后 的数组 nums 和一个整数 target ，如果 nums 中存在这个目标值 target ，则返回它的索引，否则返回 -1 。
     输入：nums = [4,5,6,7,0,1,2], target = 0
     输出：4
     */
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else {
            return -1
        }
        
        if nums.count == 1 {
            return nums[0] == target ? 0 : -1
        }
        var left = 0
        var right = nums.count - 1
        while right >= left {
            let middle = (left + right) >> 1
            if nums[middle] == target {
                return middle
            }
            if nums[0] <= nums[middle] {
                if target >= nums[0], target < nums[middle] {
                    right = middle - 1
                } else {
                    left = middle + 1
                }
            } else {
                if target > nums[middle], target <= nums.last! {
                    left = middle + 1
                } else {
                    right = middle - 1
                }
            }
        }
        
        return -1
    }
}
