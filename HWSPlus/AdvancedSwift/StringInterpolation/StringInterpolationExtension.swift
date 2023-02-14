//
//  StringInterpolationExtension.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 14/2/23.
//

import Foundation


extension String.StringInterpolation {
    
    mutating func appendInterpolation(signed value: Int) {
        let stringForm = String(value)
        
        if value < 0 {
            appendLiteral(stringForm)
        } else {
            appendLiteral("+" + stringForm)
        }
    }
}

struct SignedValues {
    var tempToday = 5
    var tempYesterday = -5
    var temp:String {
        "La temperatura de hoy es \(signed: tempToday), la de ayer fue de \(tempYesterday)"
    }
}

extension String.StringInterpolation {
    mutating func appendInterpolation(joined value: [String]) {
        let list = ListFormatter.localizedString(byJoining: value)
        appendLiteral(list)
    }
}

struct ArrayStringsJoined {
    let names = ["Amy","Clara","Rose"]
    var companions: String {
        "Companions: \(joined: names)."
    }
}


extension String.StringInterpolation {
    mutating func appendInterpolation(dateTime value: Date, date: DateFormatter.Style = .none, time: DateFormatter.Style = .none) {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateStyle = date
        formatter.timeStyle = time
        appendLiteral(formatter.string(from: value))
    }
}

struct DateStringInterpolation {
    let date = Date()
    var fecha = "Fecha: \(dateTime: .now, date: .medium)\nHora: \(dateTime: .now, time: .short)"
}

extension String.StringInterpolation {
    mutating func appendInterpolation(repeat function: @autoclosure () -> CustomStringConvertible, count: Int = 3, separator: String = ", " ) {
        
        let result = (0..<count).map { _ in function().description }
        appendLiteral(result.joined(separator: separator))
    }
}

struct RepeatingStringInterpolation {
    let example = "I \(repeat: "choo",separator: "- ")se you.\n Happy Valentines"
    let example2 = "Random Numbers: \(repeat: Int.random(in: 1...50),count: 7)."
}


extension String.StringInterpolation {
    
    mutating func appendInterpolation<T: Encodable & AnyObject>(clase value: T) {
        let encoder = JSONEncoder()
        
        if let result = try? encoder.encode(value) {
            let str = String(decoding: result, as: UTF8.self)
            appendLiteral(str)
        }
    }
}

struct EncodableStringInterpolation {
    class UserClass: Encodable {
        let name = "Taylor Swift"
        let age = 26
        let emailAddress = "taylor@swift.com"
    }
  
    let example = "\(clase: UserClass())"
}


extension String.StringInterpolation {
    mutating func appendInterpolation(url value: String) {
        
        if value.hasPrefix("http") {
            let anchor = "<a>\(value)</a>"
            appendLiteral(anchor)
        }
    }
}

struct URLStringInterpolation {
    let example = "\(url: "https://www.proximaparadaswift.dev")"
}

extension String.StringInterpolation {
    //mutating func appendInterpolation(
    
    enum Parametros: String {
        case sum, multiplication, average
    }
    
    mutating func appendInterpolation(operation: Parametros,_ value: [Int]) {
        guard !value.isEmpty else { return }
        var result = 0
        defer {
            appendLiteral("\(operation): \(result)")
        }
        switch operation {
        case .sum:
            result = value.reduce(0, +)
        case .multiplication:
            result = value.reduce(1, *)
        case .average:
            result = value.reduce(0, +) / value.count
        }
    }
}

struct OperationStringInterpolation {
    let array = [1,2,3,4,5]
    var example: String { "\(operation: .average, array)"
    }
    var example2: String { "\(operation: .multiplication, array)"
    }
    var example3: String { "\(operation: .sum, array)"
    }
}
