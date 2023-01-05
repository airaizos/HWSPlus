import Foundation
struct Spacer {
    func line(_ title: String? = "-") {
        print("\n *-*-*-*-*-*-*-*-*-*\(title!)*-*-*-*-*-*-*-*-*-* \n")
    }
}
let spacer = Spacer()

/**
 **04.Ene.2023**
 ##Parsing Json##
 [Parsing difficult JSON
 ](https://www.hackingwithswift.com/plus/working-with-data/parsing-difficult-json)
 **/

let json = """
[
    {
        "name": "Taylor Swift",
        "company": "Taytay Inc",
        "age": 26,
        "address": {
            "street": "555 Taylor Swift Avenue",
            "city": "Nashville",
            "state": "Tennessee",
            "gps": {
                "lat": 36.1868667,
                "lon": -87.0661223
            }
        }
    },
    {
        "title": "1989",
        "type": "studio",
        "year": "2014",
        "singles": 7
    },
    {
        "title": "Shake it Off",
        "awards": 10,
        "hasVideo": true
    }
]
"""

spacer.line("Diggin manually")

let data = Data(json.utf8)

if let objects = try? JSONSerialization.jsonObject(with: data) as? [[String:Any]] {
    
    //Hay que hacer Casting de todos los tipos
    
    for object in objects {
        if let name = object["name"] as? String {
            print("Name: \(name)")
        }
        if let title = object["title"] as? String {
            print("Title: \(title)")
        }
        if let age = object["age"] as? Int {
            print("Age: \(age)")
        }
        if let lat = object["lat"] as? Float {
            print("Lat: \(lat)")
        }
    }
}

spacer.line("extension Dictionary")
extension Dictionary where Key == String {
    func bool(for key: String) -> Bool? {
        self[key] as? Bool
    }
    func string(for key: String) -> String? {
        self[key] as? String
    }
    func int(for key: String) -> Int? {
        self[key] as? Int
    }
    func double(for key: String) -> Double? {
        self[key] as? Double
    }
}
if let objects = try? JSONSerialization.jsonObject(with: data) as? [[String:Any]] {
    for object in objects {
        if let title = object.string(for: "title") {
            print(title)
        }
        if let age = object.int(for: "age") {
            print(age)
        }
        
        if let name = object.string(for: "name") {
            print(name)
        }
    }
}

spacer.line("Building a JSON type")

//@dynamicMemberLookup: permite acceder a propeidades dinámicamente en tiempo de ejecución en lugar de tenerlas que escribirlas todas hay que añadir el subscript
@dynamicMemberLookup
struct JSON: RandomAccessCollection {
    var value: Any?
    var startIndex: Int { array.startIndex }
    var endIndex: Int { array.endIndex }
    
    //Inicializador crea una instancia Json de un string
    init(string: String) throws {
        let data = Data(string.utf8)
        value = try JSONSerialization.jsonObject(with: data)
    }
    //Inicializador que acepta Any? para crear lo que necesitemos
    init(value: Any?) {
        self.value = value
    }
    
    //MARK: Properties
    
    var optionalBool: Bool? {
        value as? Bool
    }
    var optionalDouble: Double? {
        value as? Double
    }
    var optionalInt: Int? {
        value as? Int
    }
    var optionalString: String? {
        value as? String
    }
    //convertimos los datos de manera segura
    var bool: Bool {
        optionalBool ?? false
    }
    
    var double: Double {
        optionalDouble ?? 0.00
    }
    var int: Int {
        optionalInt ?? 0
    }
    
    var string: String {
        optionalString ?? ""
    }
    //Cuando nos pidan los datos como un aray, priero convertiremos nuestro valor como un array de Any, y después mapearemos eso para que los valores sean nuevas instancias de nuestro JSON usando el tipo Any, lo que nos permitirá hacer queries libremente
    var optionalArray: [JSON]? {
        let converted = value as? [Any]
        return converted?.map { JSON(value: $0) }
    }
    var optionalDictionary: [String: JSON]? {
        let converted = value as? [String: Any]
        return converted?.mapValues { JSON(value: $0) }
    }
    //añadimos las variables no opcionales
    var array: [JSON] {
        optionalArray ?? []
    }
    
    var dictionary:[String: JSON] {
        optionalDictionary ?? [:]
    }
    
    //MARK: Subscripts
    //para buscar en el JSON fácilmente, los subscripts nos permitirán tratar nuesstros objetos como un array o como un diccionario directamente
    
    subscript(index: Int) -> JSON {
        optionalArray?[index] ?? JSON(value: nil)
    }
    subscript(key: String) -> JSON {
        optionalDictionary?[key] ?? JSON(value: nil)
    }
    //@dynamicMemberLookup
    subscript(dynamicMember key: String) -> JSON {
        optionalDictionary?[key] ?? JSON(value: nil)
    }
}

let object = try JSON(string: json)
for item in object {
    print(item["title"].string)
    print(item["address"]["city"].string)
    print(item["address"]["gps"]["lat"].double)
}

spacer.line("dynamic Member Lookup")

for item in object {
    if let latitude = item.address.gps.lat.optionalDouble {
        print("Latitude is \(latitude)")
    }
    if let street = item.address.street.optionalString {
        print("Street is \(street)")
    }
    
}
