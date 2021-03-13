//
//  DailyTemperature.swift
//  LeetCode
//
//  Created by 张胜 on 2021/3/11.
//

import Foundation

class DailyTemperature {
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
