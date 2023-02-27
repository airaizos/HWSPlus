import Foundation

struct User: Decodable {
    let id:UUID
    let name:String
    let age:Int
}

struct MessageL: Decodable, Identifiable {
    let id:Int
    let from:String
    let message:String
    
}


func loadData() async {
    
    async let (userData, _) = URLSession.shared.data(from: URL(string: "https://hws.dev/user-24602.json")!)
    async let (messageData,_) = URLSession.shared.data(from: URL(string: "https://hws.dev/user-messages.json")!)
    
    do {
        let decoder = JSONDecoder()
        let user = try await decoder.decode(User.self, from: userData)
        let messages = try await decoder.decode([MessageL].self, from: messageData)
        print("User \(user.name) has \(messages.count) messages(s).")
    } catch {
        print("Sorry, ther was a network problem")
    }
}

await loadData()



func fetchFavorites(for user: User) async -> [Int] {
    print("Fetching favorites for \(user.name)...")
    
    
    do {
        async let (favorites, _) = URLSession.shared.data(from: URL(string: "https://hws.dev/user-favorites.json")!)
        return try await JSONDecoder().decode([Int].self, from: favorites)
    } catch {
        return []
    }
}

let user = User(id: UUID(), name: "TaylorSwift", age: 26)
async let favorites = fetchFavorites(for: user)
await print("Found \(favorites.count) favorites.")

// Auqnue sea un struct si cambiamos a var user, la propeidad será capturada en lugar de copiada. Lo mejor es dejarlo como let



