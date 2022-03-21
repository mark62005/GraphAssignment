//
//  NumberOfProvinces.swift
//  GraphAssigment
//
//  Created by Mark Wong on 2022-03-20.
//

import Foundation

/// There are n cities. Some of them are connected, while some are not. If city a is connected directly with city b, and city b is connected directly with city c, then city a is connected indirectly with city c.
/// A province is a group of directly or indirectly connected cities and no other cities outside of the group.
/// You are given an n x n matrix isConnected where isConnected[i][j] = 1 if the ith city and the jth city are directly connected, and isConnected[i][j] = 0 otherwise.
/// Return the total number of provinces.

// find the number of connected components
func findCircleNum(_ isConnected: [[Int]]) -> Int {
  var adjMatrix = isConnected
  return findCircleNumHelper(&adjMatrix)
}

private func findCircleNumHelper(_ isConnected: inout [[Int]]) -> Int {
  var visited = [Bool](repeating: false, count: isConnected.count)
  var provinceCount = 0
  
  func dfs(start: Int, adjMatrix: inout [[Int]], visited: inout [Bool]) {
    for v in 0..<adjMatrix[start].count {
      if adjMatrix[start][v] == 1 && !visited[v] {
        visited[v] = true
        dfs(start: v, adjMatrix: &adjMatrix, visited: &visited)
      }
    }
  }
  
  for v in 0..<isConnected.count {
    if !visited[v] {
      dfs(start: v, adjMatrix: &isConnected, visited: &visited)
      provinceCount += 1
    }
  }
  
  return provinceCount
}

