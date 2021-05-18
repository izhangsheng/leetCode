//
//  Tree.swift
//  LeetCode
//
//  Created by zhangsheng on 2021/2/26.
//

import Foundation

public class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(val: Int, left: TreeNode?, right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Tree {
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
    
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        var node = root
        var stack = [TreeNode]()
        while node != nil || !stack.isEmpty {
            while node != nil {
                let tmpNode = node?.left
                node?.left = node?.right
                node?.right = tmpNode
                stack.append(node!)
                node = node?.right
            }
            
            let top = stack.removeLast()
            node = top.left
        }
        
        return root
    }
    
    func isSymmetric1(_ root: TreeNode?) -> Bool {
        var result = true
        var node = root
        var stack = [TreeNode]()
        var list = [String]()
        while node != nil || !stack.isEmpty {
            if node != nil {
                stack.append(node!)
                node = node?.left
            } else {
                let top = stack.removeLast()
                node = top.right
                if top.left != nil {
                    if top.right == nil {
                        list.append("^")
                    }
                } else {
                    if top.right != nil {
                        list.append("*")
                    }
                }
                list.append(String(top.val))
            }
        }
        if !list.isEmpty {
            var left = 0
            var right = list.count - 1
            while right > left {
                if list[left] != list[right] {
                    result = false
                    break
                }
                right -= 1
                left += 1
            }
        }
        
        return result
    }
    
    // 对称二叉树
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let _ = root else {
            return true
        }
        return travelsal(root?.left, root?.right)
    }
    
    private func travelsal(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil, right == nil {
            return true
        }
        if left == nil, right != nil {
            return false
        }
        if left != nil, right == nil {
            return false
        }
        if left!.val != right!.val {
            return false
        }
        return travelsal(left?.left, right?.right) && travelsal(left?.right, right?.left)
    }
    
    /// 二叉树的右视图
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        guard let root = root else { return result }
        var queue = [root]

        // 存储着每一层的元素数量
        var level = 1
        while !queue.isEmpty {
            level -= 1
            let front = queue.removeFirst()
            if let left = front.left {
                queue.append(left)
            }
            if let right = front.right {
                queue.append(right)
            }
            
            if level == 0 { // 进入下一层遍历
                level = queue.count
                result.append(front.val)
            }
        }
        
        return result
    }
}
