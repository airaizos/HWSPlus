import Foundation

struct Spacer {
    func line(_ title: String? = "-") {
        print("\n *-*-*-*-*-*-*-*-*-*\(title!)*-*-*-*-*-*-*-*-*-* \n")
    }
}
let spacer = Spacer()
/**
 **2.Ene.2023**
##Foundation##
[Using dates safely and effectively
](https://www.hackingwithswift.com/plus/making-the-most-of-foundation/using-dates-safely-and-effectively)
**/
let identifier = "en_US@calendar=japanese"

spacer.line(".dateFormat")
let formatterDateFormat = DateFormatter()
formatterDateFormat.locale = Locale(identifier: identifier)
formatterDateFormat.dateFormat = "dd/MM/yyyy"
print(formatterDateFormat.string(from: Date()))

spacer.line(".dateStyle")
let formatterStyle = DateFormatter()
formatterStyle.locale = Locale(identifier: identifier)
formatterStyle.dateStyle = .long
formatterStyle.timeStyle = .full

print(formatterStyle.string(from: Date()))

spacer.line("ISO8601")

let formatter8601 = ISO8601DateFormatter()
formatter8601.timeZone = .init(identifier: "ANAT")
print(formatter8601.string(from: Date()))

spacer.line(".setLocalizedDateFormatFromTemplate")

let formatterLocalized = DateFormatter()
formatterLocalized.locale = Locale(identifier: "es_MX")
formatterLocalized.setLocalizedDateFormatFromTemplate("dMy")
print(formatterLocalized.string(from: Date()))


spacer.line("Experiments")

let formatter = DateFormatter()
formatter.locale = Locale(identifier: "es")
formatter.formattingContext = .beginningOfSentence
formatter.dateFormat = "d-M-y"

print(formatter.string(from: Date()))
