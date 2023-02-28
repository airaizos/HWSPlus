import Foundation

private func fetchUsers() async throws {
    let url = URL(string: "http://hws.dev/users.csv")!
    
    for try await line in url.lines {
        if line.contains("Mexico") {
            print("User in México: \(line)")
        }
    }
    print("Finalizado")
}

let secuencia:()? = try? await fetchUsers()


private func printUsers() async throws {
    let url = URL(string: "https://hws.dev/users.csv")!
    
    for try await line in url.lines {
        let parts = line.split(separator: ",")
        guard parts.count == 4 else { continue }
        
        guard let id = Int(parts[0]) else { continue }
        let firstName = parts[1]
        let lastName = parts[2]
        let country = parts[3]
        
        print("Found user #\(id): \(firstName) \(lastName) from \(country)")
    }
}

let asycSe:()? = try? await printUsers()


func printUsersIterator() async throws {
    let url = URL(string: "https://hws.dev/users.csv")!
    
    var iterator = url.lines.makeAsyncIterator()
    
    if let line = try await iterator.next() {
        print("The first user is \(line)")
    }
    
    for i in 2...5 {
        if let line = try await iterator.next() {
            print("User #\(i): \(line)")
        }
    }
    var remainingResults = [String]()
    
    while let result = try await iterator.next() {
        remainingResults.append(result)
    }
    
    print("There were \(remainingResults.count) other users")
}

try? await printUsersIterator()
