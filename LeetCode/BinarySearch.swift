//
//  BinarySearch.swift
//  LeetCode
//
//  Created by 张胜 on 2021/3/16.
//

import Foundation

class BinarySearch {
    /**
     整数数组 nums 按升序排列，数组中的值 互不相同 。

     在传递给函数之前，nums 在预先未知的某个下标 k（0 <= k < nums.length）上进行了 旋转，使数组变为 [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]（下标 从 0 开始 计数）。例如， [0,1,2,4,5,6,7] 在下标 3 处经旋转后可能变为 [4,5,6,7,0,1,2] 。

     给你 旋转后 的数组 nums 和一个整数 target ，如果 nums 中存在这个目标值 target ，则返回它的索引，否则返回 -1 。
     输入：nums = [4,5,6,7,0,1,2], target = 0
     输出：4
     */
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        let count = nums.count
        if count == 1 {
            return nums[0] == target ? 0 : -1
        }
        var left = 0
        var right = count - 1
        while right >= left {
            let middle = (left + right) >> 1
            if nums[middle] == target {
                return middle
            }
            if nums[0] <= nums[middle] {
                if nums[0] <= target, target < nums[middle] {
                    /// 左半部分有序
                    right = middle - 1
                } else {
                    /// 右半部分有序
                    left = middle + 1
                }
            } else {
                if nums[middle] < target, target <= nums[count - 1] {
                    left = middle + 1;
                } else {
                    right = middle - 1;
                }
            }
        }
        
        return -1
    }
    
}
