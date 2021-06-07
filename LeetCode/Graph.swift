//
//  Graph.swift
//  LeetCode
//
//  Created by zhangsheng on 2021/6/4.
//

import Foundation

class Graph {
    
    /// leetcode: 210
    /// 现在你总共有 n 门课需要选，记为 0 到 n-1。
    /// 在选修某些课程之前需要一些先修课程。 例如，想要学习课程 0 ，你需要先完成课程 1 ，我们用一个匹配来表示他们: [0,1]
    /// 给定课程总量以及它们的先决条件，返回你为了学完所有课程所安排的学习顺序。
    /// 可能会有多个正确的顺序，你只要返回一种就可以了。如果不可能完成所有课程，返回一个空数组。
    /// - Parameters:
    ///   - numCourses: 课程数
    ///   - prerequisites: 课程依赖数组
    /// - Returns: 结果集
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var queue = [Int]()
        var result = [Int]()
        // 入度数组
        var inDegree = Array(repeating: 0, count: numCourses)
        for subArray in prerequisites {
            // 计算所有课程的入度
            inDegree[subArray[0]] += 1
        }
        
        for i in 0 ..< inDegree.count {
            if inDegree[i] == 0 {
                queue.append(i)
            }
        }
        
        /// [[1,0],[1,2],[0,1]]
        
        while !queue.isEmpty {
            let front = queue.removeFirst()
            result.append(front)
            
            for subArray in prerequisites {
                if subArray[1] == front {
                    var inD = inDegree[subArray[0]]
                    inD -= 1
                    if inD == 0 {
                        queue.append(subArray[0])
                    } else {
                        inDegree[subArray[0]] = inD
                    }
                }
            }
        }
        
        return result.count == numCourses ? result : []
    }
    
    func findOrder1(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        // 初始化图--邻接矩阵实现方式
        var graph = Array(repeating: [Int](), count: numCourses)
        var degree = Array(repeating: 0, count: numCourses)
        // [[1,0],[2,0],[3,1],[3,2]]
        for prereq in prerequisites {
            // 依赖此课程的所有课程
            graph[prereq[1]].append(prereq[0])
            // 增加相应的依赖课程的出度
            degree[prereq[0]] += 1
        }

        var courses = [Int]()
        for i in 0 ..< degree.count {
        // for (i, num) in degree.enumerated() {
            // 出度为0意味着任何依赖，可以学习，加入待学习列表
            let num = degree[i]
            if num == 0 {
                courses.append(i)
            }
        }

        var res = [Int]()
        while !courses.isEmpty {
            let current = courses.removeLast()
            res.append(current)
            // 依赖此课程的所有课程出度间减1
            for course in graph[current] {
                degree[course] -= 1
                if degree[course] == 0 {
                    courses.append(course)
                }
            }
        }

        // 如果不可能完成所有课程，返回一个空数组
        if res.count != numCourses {
            res.removeAll()
        }
        return res
    }
}
