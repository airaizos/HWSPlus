import Foundation

private func shoutQuotes() async throws {
    let url = URL(string: "https://hws.dev/quotes.txt")!
    let uppercasedLines = url.lines.map(\.localizedUppercase)
    
    for try await line in uppercasedLines {
        print(line)
    }
    
}

let shout = try? await shoutQuotes()


struct Quote {
    let text: String
}

private func printQuotes() async throws {
    let url = URL(string: "https://hws.dev/quotes.txt")!
    let quotes = url.lines.map(Quote.init)
    
    for try await quote in quotes {
        print(quote.text)
    }
}
let quotes = try? await printQuotes()

private func printAnonymousQuotes() async throws {
    let url = URL(string:"https://hws.dev/quotes.txt")!
    let anonymousQuotes = url.lines.filter { $0.contains("Anonymous") }
    
    for try await line in anonymousQuotes {
        print(line)
    }
    
}

try? await printAnonymousQuotes()


private func printTopQuotes() async throws {
    let url = URL(string: "https://hws.dev/quotes.txt")!
    let topQuotes = url.lines.prefix(5)
    
    for try await line in topQuotes {
        print(line)
    }
}

let top = try? await printTopQuotes()


//Al ser async sequences compejas es mejor deolver un tip opaco de valor


private func getQuotes() async -> some AsyncSequence {
    let url = URL(string: "https://hws.dev/quotes.txt")!
    let anonymousQuotes = url.lines.filter { !$0.contains("Anonymous") }
    let topAnonymousQuotes = anonymousQuotes.prefix(10)
  
    let shoutingTopAnonymousQuotes = topAnonymousQuotes.map(\.localizedUppercase)
    
    return shoutingTopAnonymousQuotes
    
}

let result = await getQuotes()

do {
    for try await quote in result {
        print(quote)
    }
} catch {
    print("error fetching quotes")
}


private func checkQuotes() async throws {
    let url = URL(string: "https://hws.dev/quotes.txt")!
    let noShortQuotes = try await url.lines.allSatisfy { $0.count > 25 }
    print(noShortQuotes)
}

let checked = try? await checkQuotes()


private func printHighestNumber() async throws {
    let url = URL(string: "http://hws.dev/random-numbers.txt")!
    
    if let highest = try await url.lines.compactMap(Int.init).max() {
        
        print("Highest number: \(highest)")
    } else {
        print("No number was the highest")
    }
    
}

let highest = try? await printHighestNumber()


private func sumRandomNumbers() async throws {
    let url = URL(string: "https://hws.dev/random-numbers.txt")!
    
    let sum = try await url.lines.compactMap(Int.init).reduce(0,+)
    print("Sum of number:\(sum)")
}

try? await sumRandomNumbers()
