//
//  ValidBracket.swift
//  LeetCode
//
//  Created by 张胜 on 2021/3/13.
//

import Foundation

class ValidBracket {
    public func isValid(_ s: String) -> Bool {
        guard !s.isEmpty else {
            return false
        }
        
        guard s.count % 2 == 0 else {
            return false
        }
        
        var stack = [Character]()
        for c in s {
            if c == "[" || c == "(" || c == "{" {
                stack.append(c)
            } else {
                if stack.isEmpty {
                    return false
                } else {
                    let left = stack.removeLast()
                    if left == "(", c != ")" { return false }
                    if left == "[", c != "]" { return false }
                    if left == "{", c != "}" { return false }
                }
            }
        }
        
        return stack.isEmpty
    }
}
