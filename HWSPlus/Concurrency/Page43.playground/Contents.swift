import Foundation

struct MessageC: Decodable, Identifiable {
    let id:Int
    let from:String
    let message:String
    
}


func fetchMessages(completion: @escaping ([MessageC]) -> Void) {
    let url = URL(string: "https://hws.dev/user-messages.json")!
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        
        if let data = data {
            if let messages = try? JSONDecoder().decode([MessageC].self, from: data) {
                
                completion(messages)
                return
            }
        }
        completion([])
    }.resume()
}

func fetchMessages() async -> [MessageC] {
    await withCheckedContinuation({ continuation in
        fetchMessages { messages in
            continuation.resume(returning: messages)
        }
    })
}

let messages = await fetchMessages()
print("Downloaded \(messages.count) messages.")
