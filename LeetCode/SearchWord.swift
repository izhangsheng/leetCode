//
//  SearchWord.swift
//  LeetCode
//
//  Created by 张胜 on 2021/4/11.
//

import Foundation

class SearchWord {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard !board.isEmpty, !word.isEmpty else {
            return false
        }
        var mBoard = board
        let m = board.count
        let n = board[0].count
        let characters = Array(word)
        for i in 0 ..< m {
            for j in 0 ..< n {
                if board[i][j] == characters[0] {
                    if dfs(&mBoard, characters, i, j, 0) { return true }
                }
            }
        }
        
        return false
    }
    
    @discardableResult private func dfs(_ board: inout [[Character]], _ cs: [Character], _ row: Int, _ column: Int, _ k: Int) -> Bool {
        if k == cs.count {
            return true
        }
        
        if row < 0 || column < 0 || row >= board.count || column >= board[row].count {
            return false
        }
        
        guard cs[k] == board[row][column] else {
            return false
        }
        let t = board[row][column]
        board[row][column] = Character("0")
        let res = dfs(&board, cs, row - 1, column, k + 1) ||
                dfs(&board, cs, row, column - 1, k + 1) ||
                dfs(&board, cs, row + 1, column, k + 1) ||
                dfs(&board, cs, row, column + 1, k + 1)
        
        board[row][column] = t
        return res
    }
}
