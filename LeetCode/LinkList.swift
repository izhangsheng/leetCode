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
    
    
}
