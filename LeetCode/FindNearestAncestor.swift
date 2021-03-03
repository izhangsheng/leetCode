//
//  FindNearestAncestor.swift
//  LeetCode
//
//  Created by zhangsheng on 2021/2/26.
//

import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(val: Int, left: TreeNode?, right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class FindNearestAncestor {
    
    func lowestCommonAncestor(root: TreeNode?, p: TreeNode, q: TreeNode) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if p.val == root.val || q.val == root.val {
            return root
        }
        let leftP = lowestCommonAncestor(root: root.left, p: p, q: q)
        let rightP = lowestCommonAncestor(root: root.right, p: p, q: q)
        return leftP == nil ? rightP : (rightP == nil ? leftP : root)
    }
}
