//
//  SpaceshipOperator.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 13/1/23.
//

import Foundation


infix operator <=>

/*
func <=><T: Comparable>(lhs: T, rhs: T) -> Int {
    if lhs < rhs { return -1 }
    if lhs > rhs { return 1 }
    return 0
}
 */
/*
let left = 5
let right = 6
let result: Int = left <=> right
print(result) // - 1
*/

/// #Swiftly approach#

func <=><T: Comparable>(lhs: T, rhs: T) -> ComparisonResult {
    if lhs < rhs { return .orderedAscending }
    if lhs > rhs { return .orderedDescending }
    return .orderedSame
}

func compare(a: Int, b: Int) -> Int {
    print((a <=> b).rawValue)

    return (a <=> b).rawValue
}
