//
//  RecoverBST.swift
//  LeetCode
//
//  Created by zhangsheng on 2021/2/26.
//

import Foundation

class RecoverBST {
    var preNode: TreeNode?
    var firstNode: TreeNode?
    var secondNode: TreeNode!
    func findWrongNode(root: TreeNode) {
        inorder(node: root)
        let tmp = firstNode!.val
        firstNode!.val = secondNode.val
        secondNode.val = tmp
    }
    
    func inorder(node: TreeNode?) {
        guard let _ = node else {
            return
        }
        inorder(node: node?.left)
        if let preNodeOk = preNode {
            if preNodeOk.val > node!.val {
                secondNode = node
                if firstNode != nil {
                    return
                }
                firstNode = preNode
            }
        }
        preNode = node
        inorder(node: node?.right)
    }
}
