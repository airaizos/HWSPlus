import Foundation

///Todas las propiedades mutables y los métodos de un `actor` están aislados a ese actor por defecto. Lo que significa que no se puede acceder directamente desde código que esté fuera del actor. Acceder a constantes está permitido porque es seguro, pero si quieres que el actor tenga métodos no aislados se puede usar la parlaba reservada `nonisolated`

actor DataStore {
    var username = "Anonymous"
    var friends = [String]()
    var highScores = [Int]()
    var favorites = Set<Int>()
    
    nonisolated let id:Int
    init(id:Int) { self.id =  id}
    
    
    
    func save() {
        
    }
}

//Aunque indique isolated sigue habiendo un solo hilo al cual se acceda. Solo se puede tener un parámetro marcado como isolated, el que está ejecutando la función.
func debugLog(dataStore: isolated DataStore) {
    print("Username ",dataStore.username)
    print("Friends ",dataStore.friends)
    print("HighScore ",dataStore.highScores)
    print("Favorites ", dataStore.favorites)
}

let data = DataStore(id: 1)

Task {
    await debugLog(dataStore: data)
    
    print("id: ",data.id)
}

///**NonIsolated**


import CryptoKit

actor User:Codable {
    let username:String
    let password:String
    var isOnline = false
    
    
   
    
    init(username:String, password:String) {
        self.username = username
        self.password = password
    }
    
    // al marcarla como nonisolated podemos llamarla externamente sin usar await
    nonisolated func passwordHash() -> String {
        let passwordData = Data(password.utf8)
        let hash = SHA256.hash(data: passwordData)
        return hash.compactMap { String(format: "%02x", $0) }.joined()
        }
    
    //para conformarlo como Codale, tenemos que implementar la función 'encode' nosotros mismos
    
    enum CodingKeys: CodingKey {
        case username, password
    }
    
    nonisolated func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(username, forKey: .username)
        try container.encode(password, forKey: .password)
    }
    
}
//Generar jsons
let user = User(username: "twoStraws", password: "s3kr1t")
print(user.passwordHash())
if let encoded = try? JSONEncoder().encode(user) {
    let json = String(decoding: encoded, as: UTF8.self)
    print(json)
}
