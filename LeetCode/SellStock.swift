//
//  SellStock.swift
//  LeetCode
//
//  Created by 张胜 on 2021/3/9.
//

import Foundation

class SellStock {
    func maxProfit(_ prices: [Int]) -> Int {
        var max = 0
        for i in 0 ..< prices.count - 1 {
            for j in (i + 1) ..< prices.count {
                if (prices[j] - prices[i]) > max {
                    max = prices[j] - prices[i]
                }
            }
        }
        return max
    }
}
