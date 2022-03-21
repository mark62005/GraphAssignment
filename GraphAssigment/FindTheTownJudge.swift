//
//  FindTheTownJudge.swift
//  GraphAssigment
//
//  Created by Mark Wong on 2022-03-20.
//

import Foundation

/// In a town, there are n people labeled from 1 to n. There is a rumor that one of these people is secretly the town judge.
///
/// If the town judge exists, then:
/// - The town judge trusts nobody.
/// - Everybody (except for the town judge) trusts the town judge.
/// - There is exactly one person that satisfies properties 1 and 2.
///
/// You are given an array trust where trust[i] = [ai, bi] representing that the person labeled ai trusts the person labeled bi.
/// Return the label of the town judge if the town judge exists and can be identified, or return -1 otherwise.


// Directed Graph

// Time -> O(N2) -> O(N)
// Space -> O(N)
func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
  var degrees = [Int](repeating: 0, count: n + 1)
  
  // Time -> O(N)
  for i in 0..<trust.count {
    let person = trust[i]
    // the number of persons which that person trust other than theirselves
    degrees[person[0]] -= 1
    // the number of persons who trust that person
    degrees[person[1]] += 1
  }
  
  // Time -> O(N)
  for i in 1..<n + 1 {
    // if a person is trusted by (n - 1) number of persons, they will be the judge
    if degrees[i] == n - 1 {
      return i
    }
  }
  
  return -1
}
