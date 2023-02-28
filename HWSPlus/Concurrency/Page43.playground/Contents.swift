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


enum FetchError: Error {
    case noMessages
}

func fetchMessagesThrowing() async -> [MessageC] {
    do {
        return try await withCheckedThrowingContinuation{ continuation  in
            fetchMessages { messages in
                if messages.isEmpty {
                    continuation.resume(throwing: FetchError.noMessages)
                } else {
                    continuation.resume(returning: messages)
                }
            }
        }
    } catch {
        return [MessageC(id: 1, from: "Tom", message: "Welcome to my Space")]
    }
    
}
    
    let messagesThrowing = await fetchMessagesThrowing()
    print("Descargados \(messagesThrowing.count) mensajes")
