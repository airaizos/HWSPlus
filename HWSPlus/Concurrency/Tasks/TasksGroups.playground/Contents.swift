import Foundation

func printMessage() async {
    let cadena = await withTaskGroup(of: String.self) { group -> String in
        
        group.addTask { "Hello" }
        group.addTask { "From" }
        group.addTask { "a" }
        group.addTask { "Task" }
        group.addTask { "Group" }
        
        var collected = [String]()
        for await value in group {
            collected.append(value)
        }
        
        return collected.joined(separator: " ")
    }
    print(cadena)
}

await printMessage()
