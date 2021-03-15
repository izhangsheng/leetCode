//
//  File.swift
//  LeetCode
//
//  Created by 张胜 on 2021/3/13.
//

import Foundation

public class Permute {
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
}
