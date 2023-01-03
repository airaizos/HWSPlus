import Foundation
struct Spacer {
    func line(_ title: String? = "-") {
        print("\n *-*-*-*-*-*-*-*-*-*\(title!)*-*-*-*-*-*-*-*-*-* \n")
    }
}
let spacer = Spacer()
/**
 **3.Ene.2023**
##Foundation##
[Handling names correctly
](https://www.hackingwithswift.com/plus/making-the-most-of-foundation/handling-names-correctly)
**/

spacer.line("PersonNameComponents and Formatter")
var components = PersonNameComponents()
components.givenName = "Adrián"
components.middleName = "Emilio"
components.familyName = "Iraizos"
components.nickname = "Adri"

let formatter = PersonNameComponentsFormatter()
let styles: [PersonNameComponentsFormatter.Style] = [.abbreviated,.default,.long,.medium,.short]
let defaultName = formatter.string(from: components)

for style in styles {
    formatter.style = style
    let name = formatter.string(from: components)
    print("Style: \(style.rawValue) : \(name)")
}

spacer.line("Parsing From Strings")


if let adrian = formatter.personNameComponents(from: "Iraizos Adrián") {
    print(adrian)
}

if let john = formatter.personNameComponents(from: "John Adrien Lee") {
    print(john)
}
