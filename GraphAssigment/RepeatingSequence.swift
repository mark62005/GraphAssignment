//
//  RepeatingSequence.swift
//  GraphAssigment
//
//  Created by Mark Wong on 2022-03-18.
//

import Foundation

// Time Complexity = ?
func repeatingSequence() {
  // 1. get user inputs
  let firstLine = readLine()!.split(separator: " ")
  //  - first number: D[1] = A (1 <= A <= 9999)
  let firstValue = Int(firstLine[0])!
  //  - power = P (1 <= P <= 5)
  let exponent = Int(firstLine[1])!
    
  // 2. get the index of the first repeating number -> start of a cycle
  var nums = [Int]()
  let index = getFirstRepeatingNumberIndex(nums: &nums, num: firstValue, exponent: exponent)
  print(index)
}

// Time Complexity = ?
private func getFirstRepeatingNumberIndex(nums: inout [Int], num: Int, exponent: Int) -> Int {
  // Time -> O(nums.count)
  if nums.contains(num) {
    return nums.firstIndex(of: num)!
  }
  
  nums.append(num)
  // Time -> O(D + D*P)
  return getFirstRepeatingNumberIndex(nums: &nums, num: getNextValue(num: num, exponent: exponent), exponent: exponent)
}

// Time -> O(D + D*P)
private func getNextValue(num: Int, exponent: Int) -> Int {
  // Time -> O(D)
  var digits = [Int]()
  digits = getAllDigits(num: num, digits: &digits)
  
  // Time -> O(D * P)
  var nextValue = 0
  for digit in digits {
    nextValue += (power(base: digit, exponent: exponent) )
  }
  
  return nextValue
}

// Time -> O(P)
private func power(base: Int, exponent: Int) -> Int {
  if exponent == 0 {
    return 1
  }
  return power(base: base, exponent: exponent - 1) * base
}

// Time -> O(D)
private func getAllDigits(num: Int, digits: inout [Int]) -> [Int] {
  if num < 10 {
    digits.insert(num, at: 0)
    return digits
  }
  
  let remainder = num % 10
  digits.append(remainder)
  return getAllDigits(num: num / 10, digits: &digits)
}
