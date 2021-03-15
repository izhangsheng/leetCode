//
//  SubSequence.swift
//  LeetCode
//
//  Created by 张胜 on 2021/3/8.
//

import Foundation

class Subsequence {
    
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
}
