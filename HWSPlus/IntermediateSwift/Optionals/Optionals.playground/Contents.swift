import UIKit
import SwiftUI
extension String {
    
    func separator() -> Void {
        print("\n *-*-*-*-*-*-*-*-*-* \(self) *-*-*-*-*-*-*-*-*-* \n")
    }
}
    
/// 6 diferentes maneras de tratar opcionales

/// #Nil coalescing
"Nil coalescing".separator()
    
func username(for id: Int) -> String? {
    if id == 13 {
        return "Taylor Swift"
    }
    return nil
}

let user = username(for: 556) ?? "Anonymous"
print(user)


let cache = (try? String(contentsOfFile: "cache.txt")) ?? ""

print(cache)
