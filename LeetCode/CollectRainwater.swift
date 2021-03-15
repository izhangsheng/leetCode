//
//  CollectRainwater.swift
//  LeetCode
//
//  Created by zhangsheng on 2021/3/12.
//

import Foundation

class CollectRainwater {

//    // 暴力解法
//    func trap(_ height: [Int]) -> Int {
//        let count = height.count
//        guard count > 2 else {
//            return 0
//        }
//
//        var leftMax = height[0]
//        var rainWater = 0
//
//        for i in 1 ..< count {
//            leftMax = max(leftMax, height[i - 1])
//            var end = count - 1
//            var rightMax = height[count - 1]
//            while end > i {
//                rightMax = max(rightMax, height[end])
//                end -= 1
//            }
//
//            let minV = min(leftMax, rightMax)
//            rainWater = rainWater + max(0, minV - height[i])
//        }
//
//        return rainWater
//    }
    
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
}