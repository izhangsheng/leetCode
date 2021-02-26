//
//  FindNearestAncestor.swift
//  LeetCode
//
//  Created by zhangsheng on 2021/2/26.
//

import Foundation

class FindNearestAncestor {
    class TreeNode {
        var val: Int
        var left: TreeNode?
        var right: TreeNode?
        init(val: Int, left: TreeNode?, right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
        
        convenience init(val: Int) {
            self.init
        }
    };
}
