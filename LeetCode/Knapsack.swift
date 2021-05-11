//
//  Knapsack.swift
//  LeetCode
//
//  Created by zhangsheng on 2021/3/16.
//

import Foundation

class Knapsack {
    /// 承重为w的背包装重量为weights和价值为values的最大价值
    /// - Parameters:
    ///   - weights: 物品重量数组
    ///   - values: 物品价值数组
    ///   - n: 最大承重的背包
    /// - Returns: 返回对打价值
    func maximumValue(weights: [Int], values: [Int], n: Int) -> Int {
        let count = weights.count
        guard count == values.count, count > 0 else {
            return 0
        }
        
//        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: count + 1)
        var dp = Array(repeating: 0, count: n + 1)
        var k = n
        for i in 1 ... count {
            while k > 0 {
                if weights[i - 1] > k {
                    dp[k] = max(dp[k], dp[k - weights[i - 1]] + values[i - 1])
                }
                k -= 1
            }
//            for j in 1 ... n {
//                if weights[i - 1] > j {
//                    dp[i][j] = max(dp[i][j - 1], dp[i - 1][j - weights[i]] + values[i - 1])
//                } else {
//                    dp[i][j] = dp[i][j - 1]
//                }
//            }
        }
        
        return dp[n]
    }
    
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
}
