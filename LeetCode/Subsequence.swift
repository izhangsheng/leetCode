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
}
