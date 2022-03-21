//
//  CyclicPermutation.swift
//  GraphAssigment
//
//  Created by Mark Wong on 2022-03-18.
//

import Foundation

func cyclicPermutation() {
  // 1. get user inputs
  //  - the number of test cases T
  let testCasesNum = Int(readLine()!)!
  
  print("\nOutput")
  for _ in 0..<testCasesNum {
    //  - size N of the permutation (2 <= N <= 1000)
    let permutationSize = Int(readLine()!)!
    //  - a permutation of N integers. (space-separated)
    let secondLine = readLine()!.split(separator: " ")
    
    // 2. create a adjList
    var adjList = [[Int]](repeating: [], count: permutationSize + 1)
    
    // starting point
    for u in 1...permutationSize {
      // destination
      let v = Int(secondLine[u - 1])!
      
      // e.g.
      // 1 2 3 4 5 6 7 8
      // 3 2 7 8 1 4 5 6
      adjList[u].append(v)
    }

    // 3. count the no of cycle
    var cycleCount = 0
    
    // 4. dfs
    func dfs(start: Int, adjList: inout [[Int]], visited: inout [Bool]) {
      visited[start] = true
      
      for v in adjList[start] {
        if !visited[v] {
          dfs(start: v, adjList: &adjList, visited: &visited)
        } else {
          cycleCount += 1
        }
      }
    }
    
    var visited = [Bool](repeating: false, count: permutationSize + 1)
    for v in 1..<adjList.count {
      if !visited[v] {
        dfs(start: v, adjList: &adjList, visited: &visited)
      }
    }
    
    print(cycleCount)
  }
}
