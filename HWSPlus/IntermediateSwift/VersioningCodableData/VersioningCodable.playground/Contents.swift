import Foundation

struct Employee: Decodable {
    var id: Int
    var name: String
    var age: Int
    
    /// Conforme se van haciendo actualizaciones, lo más fácil es añadir propiedades opcionales, pero eso lleva a dudas sobre los datos. ¿Se ha actualizado o el usuario no quiere proporcionar su número de teléfono? ¿ Y si la API ha cambiado y ahora la propiedad tiene otro nombre?
    var phone: String?
    var city: String?
    var intialDate: Date?
    var finalDate: Date?
}

let json = """
{
    "id": 1,
    "name": "Taylor Swift",
    "age": 26
}
"""

let jsonData = Data(json.utf8)
let decoder = JSONDecoder()

// No hace falta controlar errores cuando se usa try, porque se lanzarán como un error del programa.
let taylor = try decoder.decode(Employee.self, from: jsonData)
print("\(taylor.name) is \(taylor.age) years old.")


struct SuperEmployee {
    var id: Int
    var name: String
    var age: Int
    var country: String
}

/// Ahora creamos un archivo aparte con la responsabilidad de decodificar las instancias de SuperEmployee

extension SuperEmployee: Decodable {
    private struct EmployeeV1: Decodable {
        let id: Int
        let name: String
        let age: Int
    }
    
    private struct EmployeeV2: Decodable {
        let id: Int
        let name: String
        let currentAge: Int
        let country: String
    }
    
    /// Nosotros intentamos decodificar la instancia del struct. Comanzando por el **más reciente**
    ///  Si primero decodificas versiones anteriores a versiones más complejas, se perderá información.
    init(from decoder: Decoder) throws {
        do {
            let employee = try EmployeeV2(from: decoder)
            self.init(id: employee.id, name: employee.name, age: employee.currentAge, country: employee.country)
        } catch {
            let employee = try EmployeeV1(from: decoder)
            self.init(id: employee.id, name: employee.name, age: employee.age, country: "")
        }
    }
}


///  ¿ Es una buena alternativa esta?

extension SuperEmployee {
    enum CodingKeys: CodingKey {
        case id, name, age, currentAge, country
    }
    /// La complejidad es mayor e irá creciendo más y más, los structs podrían ser más variados
    init(fromD decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        
        /// Pueden quedar mezclados currentAge y country si están presentes, se mezclan versiones
        if let ageV2 = try container.decodeIfPresent(Int.self, forKey: .currentAge) {
            age = ageV2
        } else {
            age = try container.decode(Int.self, forKey: .age)
        }
        
        country = try container.decodeIfPresent(String.self, forKey: .country) ?? ""
    }
}
