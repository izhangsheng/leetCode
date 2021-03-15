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
}
