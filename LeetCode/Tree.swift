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
    
    /// 二叉树的右视图 ----> bfs
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
    
    // ---> dfs
    func rightSideView1(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        guard let root = root else { return result }
        dfs(root, 0, &result)
        return result
    }
    
    private func dfs(_ node: TreeNode?, _ depth: Int, _ res: inout [Int]) {
        guard let node = node else { return }
        var idx = depth
        if idx == res.count {
            res.append(node.val)
        }
        
        idx += 1
        dfs(node.right, idx, &res)
        dfs(node.left, idx, &res)
    }
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return false
        }
        var isBst = true
        
        var preEle = Int.min
        var stack = [TreeNode]()
        var travelNode: TreeNode? = root
        while !stack.isEmpty || travelNode != nil {
            if let nodeOk = travelNode {
                stack.append(nodeOk)
                travelNode = nodeOk.left
            } else {
                let removeTop = stack.removeLast()
                if preEle > removeTop.val {
                    isBst = false
                    break
                }
                preEle = removeTop.val
                travelNode = removeTop.right
            }
        }
        
        return isBst
    }
    
    /// 查找二叉搜索树的后继节点
    func inorderSuccessor(root: TreeNode, p: TreeNode) -> TreeNode? {
        var node: TreeNode? = root
        var stack = [TreeNode]()
        var stop = false
        while node != nil || !stack.isEmpty {
            if node != nil {
                stack.insert(node!, at: 0)
                node = node?.left
            } else {
                let curNode = stack.removeFirst()
                if stop {
                    return curNode
                }
                node = curNode.right
                if p.val == curNode.val {
                    stop = true
                }
            }
        }
        
        return nil
    }
    
    func inorderSuccessor1(root: TreeNode, p: TreeNode) -> TreeNode? {
        var pre: TreeNode? = nil
        var stop = true
        dfs(root: root, p: p, pre: &pre, stop: &stop)
        return pre
    }
    
    private func dfs(root: TreeNode?, p: TreeNode, pre: inout TreeNode?, stop: inout Bool) {
        if (root == nil) { return }
        dfs(root: root?.right, p: p, pre: &pre, stop: &stop)
        if root!.val == p.val {
            stop = false;
            return;
        }
        if stop {
            pre = root
        }
        dfs(root: root?.left, p: p, pre: &pre, stop: &stop)
    }
    

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
}
