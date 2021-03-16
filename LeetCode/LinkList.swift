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
        var slow = head
        var fast = head
        while let _ = fast.next, let _ = fast.next?.next {
            slow = slow.next!
            fast = fast.next!.next!
        }
        return slow
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
}
