//
//  SellStock.swift
//  LeetCode
//
//  Created by 张胜 on 2021/3/9.
//

import Foundation

class SellStock {
//    func maxProfit(_ prices: [Int]) -> Int {
//        var max = 0
//        for i in 0 ..< prices.count - 1 {
//            for j in (i + 1) ..< prices.count {
//                if (prices[j] - prices[i]) > max {
//                    max = prices[j] - prices[i]
//                }
//            }
//        }
//        return max
//    }
    
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
}
