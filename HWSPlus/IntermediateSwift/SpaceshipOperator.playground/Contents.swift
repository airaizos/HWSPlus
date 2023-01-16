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
    
    if lhs < rhs  { return .orderedAscending }
    if lhs > rhs { return .orderedDescending }
    return .orderedSame
}

func compare(a: Int, b: Int) -> Int {
    return (a <=> b).rawValue
}

print("1 <=> 9 : \(compare(a: 1, b: 9)) .ordenAscendente")
print("18 <=> 9 : \(compare(a: 18, b: 9)) .ordenDescendente")
print("9 <=> 9 : \(compare(a: 9, b: 9)) .mismoOrden")


/// ToDo: #Challenges:#
///
/// Write a version of the spaceship operator that works across all numeric types, e.g. 2.0 (the Double) <=> 5 (the integer) will return -1.
/// For a harder challenge, can you write some code to make our operator work on arrays? It should compare each item in the arrays by index until it finds one that is before, equal to, or after the other.


func <=><T: Numeric & Comparable>(lhs: T, rhs: T) -> ComparisonResult {
    
    if lhs < rhs  { return .orderedAscending }
    if lhs > rhs { return .orderedDescending }
    return .orderedSame
}

func compare(a: Double, b: Double) -> Int {
    return (a <=> b).rawValue
}

infix operator <==>
func <==><T: CustomStringConvertible & Comparable>(lhs: T, rhs:T) -> ComparisonResult {
    if lhs < rhs { return .orderedAscending }
    if lhs > rhs { return .orderedDescending }
    return .orderedSame
}
 
func compare(a: String, b: String) -> Int {
    return (a <==> b).rawValue
}

print(compare(a: "batalla", b: "estrella"))

