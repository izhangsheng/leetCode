//
//  ShortPath.swift
//  LeetCode
//
//  Created by 张胜 on 2021/3/3.
//

import Foundation

class ShortPath {
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
}
