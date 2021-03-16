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
}
