//
//  DP.swift
//  LeetCode
//
//  Created by zhangsheng on 2021/5/24.
//

import Foundation

class DP {
    // https://leetcode-cn.com/problems/unique-paths/submissions/
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
            var dp = Array(repeating: Array(repeating: 1, count: n), count: m)
            for i in 1 ..< m {
                for j in 1 ..< n {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                }
            }
            return dp[m - 1][n - 1]
    }
    
    /// 二维数组中从左上角到右下角最短路径，只能往右、往下
    /// - Parameter paths: 二维数组
    /// - Returns: 返回路径上值相加
    func minPathSum(grid: [[Int]]) -> Int {
        guard grid.count > 0 || grid[0].count > 0 else {
            return 0
        }
        let row = grid.count
        let col = grid[0].count
        var dp = Array(repeating: Array(repeating: 99999999999999, count: col), count: row)
        dp[0][0] = grid[0][0]
        for i in 1 ..< row {
            dp[i][0] = dp[i - 1][0] + grid[i][0]
        }
        
        for j in 1 ..< col {
            dp[0][j] = dp[0][j - 1] + grid[0][j]
        }
        
        for i in 1 ..< row {
            for j in 1 ..< col {
                dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
            }
        }
        
        return dp[row - 1][col - 1]
    }
    
    /**
     输入：text1 = "abcde", text2 = "ace"
     输出：3
     解释：最长公共子序列是 "ace"，它的长度为 3。
     */
    
    /// 最长公共子序列
    /// - Parameters:
    ///   - text1: 序列1
    ///   - text2: 序列2
    /// - Returns: 长度
    
    func longestSubsequence(_ text1: String, _ text2: String) -> Int {
        let count1 = text1.count
        let count2 = text2.count
        guard count1 > 0, count2 > 0 else {
            return 0
        }
        
        let cs1 = Array(text1)
        let cs2 = Array(text2)
        var dp = Array(repeating: Array(repeating: 0, count: count2 + 1), count: count1 + 1)
        for i in 1 ... count1 {
            for j in 1 ... count2 {
                if cs1[i - 1] == cs2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        
        return dp[count1][count2]
    }
    
    /*!
     func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
         let seq1 = Array(text1)
         let seq2 = Array(text2)
         let len1 = seq1.count
         let len2 = seq2.count
         var dp = Array(repeating: Array(repeating: 0, count: len2), count: len1)
         
         let c1 = seq1[0]
         var match1 = false
         for j in 0 ..< len2 {
             if c1 == seq2[j] {
                 match1 = true
             }
             if match1 {
                 dp[0][j] = 1
             }
         }
         
         let c2 = seq2[0]
         var match2 = false
         for i in 0 ..< len1 {
             if c2 == seq1[i] {
                 match2 = true
             }
             if match2 {
                 dp[i][0] = 1
             }
         }
         
         for i in 1 ..< len1 {
             for j in 1 ..< len2 {
                 if seq2[j] == seq1[i] {
                     dp[i][j] = dp[i - 1][j - 1] + 1
                 } else {
                     dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                 }
             }
         }
         
         return dp[len1 - 1][len2 - 1]
     }
     */
    
    
    /**
     输入一个整型数组，数组中的一个或连续多个整数组成一个子数组。求所有子数组的和的最大值。要求时间复杂度为O(n)。
     */
   // 输入: nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
   // 输出: 6
   // 解释: 连续子数组 [4, -1, 2, 1] 的和最大，为 6。
    public func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var maxSum = nums[0]
        var dp = maxSum
        
        for i in 1 ..< nums.count {
            dp = dp > 0 ? dp + nums[i] : nums[i]
            maxSum = max(maxSum, dp)
        }
        
        return maxSum
    }
    
    /// 最长递增子序列 输入：nums = [10, 9, 2, 5, 3, 7, 101, 18]
    /// 输出：4
    /// 解释：最长递增子序列是 [2, 3, 7, 101]，因此长度为 4 。
    /// - Parameter nums: 一组数
    /// - Returns: 最长的
//    func lengthOfLIS(_ nums: [Int]) -> Int {
//        guard !nums.isEmpty else {
//            return 0
//        }
//        let count = nums.count
//        var dp = Array(repeating: 1, count: nums.count)
//        var maxLen = 1
//        for i in 1 ..< count {
//            for j in 0 ..< i {
//                if nums[i] > nums[j] {
//                    dp[i] = max(dp[i], dp[j] + 1)
//                }
//            }
//            maxLen = max(maxLen, dp[i])
//        }
//        return maxLen
//    }
    
    /// 单调栈解法
    func lengthOfLIS(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        var stack = [nums[0]]
        for i in 1 ..< nums.count {
            let end = stack.count
            var begin = 0
            var stop = false
            while !stop {
                if nums[i] <= stack[begin] {
                    stack[begin] = nums[i]
                    stop = true
                } else {
                    if begin == end - 1 {
                        stack.append(nums[i])
                        stop = true
                    }
                }
                begin += 1
            }
        }
        return stack.count
    }
    
    
    /// 给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。
    /// 你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。
    /// 返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。
    /// - Parameter prices: 价格数组
    /// - Returns: 哪天卖出收益最大
    func maxProfit(_ prices: [Int]) -> Int {
        let count = prices.count
        var idx = count - 2
        var rightMaxValue = prices[count - 1]
        var maxProfit = 0
        var nextProfit = 0
        while idx >= 0 {
            if rightMaxValue > prices[idx] {
                maxProfit = max(rightMaxValue - prices[idx], nextProfit)
                nextProfit = maxProfit
            } else {
                rightMaxValue = prices[idx]
            }
            idx -= 1
        }
        
        return maxProfit
    }
    
    /// 接雨水
    /// - Parameter height: 所有柱子高度
    /// - Returns: 总雨水量
    public func trap(_ height: [Int]) -> Int {
        let count = height.count
        guard count > 2 else {
            return 0
        }
        var dpRHeight = height
        var end = count - 2
        while end > 0 {
            if dpRHeight[end + 1] < height[end + 1] {
                dpRHeight[end] = height[end + 1]
            }
            dpRHeight[end] = max(dpRHeight[end + 1], height[end + 1])
            end -= 1
        }
        
        var leftMax = height[0]
        var water = 0
        for i in 1 ... count - 2 {
            leftMax = max(leftMax, height[i - 1])
            // 左右最小值
            let minValue = min(leftMax, dpRHeight[i])
            if minValue > height[i] {
                water += minValue - height[i]
            }
        }
        return water
    }
    
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
