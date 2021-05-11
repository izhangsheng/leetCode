//
//  LinkList.swift
//  LeetCode
//
//  Created by 张胜 on 2021/3/10.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public func deleteDuplicates1(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let fakeHead = ListNode(0)
        fakeHead.next = head
        
        var slowNode: ListNode? = head
        var fastNode: ListNode? = head?.next
        while let _ = slowNode, let _ = fastNode {
            
            while slowNode != nil, fastNode != nil, slowNode!.val == fastNode!.val {
                fastNode = fastNode?.next
                slowNode?.next = fastNode
            }
            
            slowNode = fastNode
            fastNode = fastNode?.next
        }
        
        return fakeHead.next
    }
    
    
    public func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let fakeHead = ListNode(0)
        fakeHead.next = head
        
        var preNode = fakeHead
        var slowNode: ListNode? = head
        var fastNode: ListNode? = head?.next
        while let _ = slowNode, let _ = fastNode {
            var isMatch = false
            
            while slowNode != nil, fastNode != nil, slowNode!.val == fastNode!.val {
                fastNode = fastNode?.next
                isMatch = true
            }
            
            if isMatch {
                preNode.next = fastNode
            } else {
                preNode.next = slowNode
                preNode = slowNode!
            }
            slowNode = fastNode
            fastNode = fastNode?.next
        }
        
        return fakeHead.next
    }
    
//    public func reverseList(_ head: ListNode?) -> ListNode? {
//        guard let _ = head else {
//            return head
//        }
//        guard let _ = head?.next else {
//            return head
//        }
//
//        let newHead = reverseList(head?.next)
//        head?.next?.next = head
//        head?.next = nil
//
//        return newHead
//    }
    
    public func reverseList(_ head: ListNode?) -> ListNode? {
        var curNode = head
        var newNode: ListNode? = nil
        
        while curNode != nil {
            let next = curNode?.next
            curNode?.next = newNode
            newNode = curNode
            curNode = next
        }
        
        return newNode
    }
    
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var slow: ListNode? = head
        var fast: ListNode? = head
        var step = 1
        while fast != nil, fast?.next != nil {
            fast = fast?.next
            if step >= k {
                slow = slow?.next
            }
            step += 1
        }
        return slow
    }
    
    /// 是否是回文链表
    /// - Parameter head: 头结点
    /// - Returns: 结果
    public func isPalindrome(_ head: ListNode?) -> Bool {
        guard let _ = head else { return true }
        guard let _ = head?.next else { return true }
        if head?.next?.next == nil {
            return head!.val == head!.next!.val
        }
            
        let middle = findMidNode(head!)
        let reverseNode = middle.next
        var rNode = reverseList(reverseNode)
        var lNode = head
        while rNode != nil {
            if rNode?.val != lNode?.val {
                return false
            }
            rNode = rNode?.next
            lNode = lNode?.next
        }
        
        return true
    }
        
    private func findMidNode(_ head: ListNode) -> ListNode {
        var slow: ListNode? = head
        var fast: ListNode? = head
        while let _ = fast, let _ = fast?.next {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow!
    }
    
    public func isPalindrome2(_ head: ListNode?) -> Bool {
        guard let _ = head else { return true }
        guard let _ = head?.next else { return true }
        if head?.next?.next == nil {
            return head!.val == head!.next!.val
        }
            
        var nodeArr = [ListNode]()
        var cur = head
        while cur != nil {
            nodeArr.append(cur!)
            cur = cur?.next
        }
        
        var left = 0
        var right = nodeArr.count - 1
        while right > left {
            if nodeArr[left].val != nodeArr[right].val {
                return false
            }
            left += 1
            right -= 1
        }
        
        return true
    }
    
    public func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        var kth = -1
        var num = k

        func bst(_ root: TreeNode?) {
            if root == nil { return }
            
            bst(root!.right)
            if k == 0 { return }
            
            num -= 1
            if num == 0 {
                kth = root!.val
            }

            bst(root!.left)
        }
        
        bst(root)
        return kth
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let fakeHead = ListNode(-1)
        
        var curNode1 = l1
        var curNode2 = l2
        
        var curNewNode: ListNode? = fakeHead
        
        while let _ = curNode1, let _ = curNode2 {
            if curNode2!.val > curNode1!.val {
                curNewNode?.next = curNode1
                curNode1 = curNode1?.next
            } else {
                curNewNode?.next = curNode2
                curNode2 = curNode2?.next
            }
            curNewNode = curNewNode?.next
        }
        
        while let _ = curNode1 {
            curNewNode?.next = curNode1
        }
        while let _ = curNode2 {
            curNewNode?.next = curNode2
        }
        
        return fakeHead.next
    }
    
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head?.next
        
        while slow != nil && fast != nil {
            if slow === fast { return true }
            slow = slow?.next
            fast = fast?.next?.next
        }

        return false
    }
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let fakeHead = ListNode(-1)
        fakeHead.next = head
        var slow: ListNode? = fakeHead
        var fast: ListNode? = head
        var idx = 0
        while let _ = fast {
            if idx >= n {
                slow = slow?.next
            }
            idx += 1
            fast = fast?.next
        }
        
        slow?.next = slow?.next?.next
        return fakeHead.next
    }
    
    /*!
    给定一个单链表，其中的元素按升序排序，将其转换为高度平衡的二叉搜索树。
    本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。
    示例:
    给定的有序链表： [-10, -3, 0, 5, 9],
    一个可能的答案是：[0, -3, 9, -10, null, 5], 它可以表示下面这个高度平衡二叉搜索树：
          0
         / \
       -3   9
       /   /
     -10  5
    来源：力扣（LeetCode）
    链接：https://leetcode-cn.com/problems/convert-sorted-list-to-binary-search-tree
    著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard let headOk = head else { return nil }
        
        return buildTree(headOk, nil)
    }
     
    private func buildTree(_ left: ListNode, _ right: ListNode?) -> TreeNode? {
        if let rightOk = right {
            if rightOk === left {
                return nil
            }
        }
        
        let midNode = getMidNode(left, right)
        let root = TreeNode(val: midNode?.val ?? 0, left: nil, right: nil)
        
        root.left = buildTree(left, midNode)
        if let _ = midNode?.next {
            root.right = buildTree(midNode!.next!, right)
        } else {
            root.right = nil
        }
        
        return nil
    }
    
    private func getMidNode(_ left: ListNode, _ right: ListNode?) -> ListNode? {
        var slow: ListNode? = left
        var fast: ListNode? = left
        while fast !== right, fast?.next !== right {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
}
