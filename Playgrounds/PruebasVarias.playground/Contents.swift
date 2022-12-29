import Foundation



class Person {
    var name: String
    var dream:String
    
    init(name: String, dream: String) {
        self.name = name
        self.dream = dream
    }
}


var persona = Person(name: "J", dream: "D")

persona.name = "John"
persona.dream = "Duerme Soñando"

print("N: \(persona.name) D: \(persona.dream)")


class PersonSet{
    private(set) var name: String
    private(set) var dream: String
    
    init(name: String, dream: String) {
        self.name = dream
        self.dream = dream
    }
    
    func newDream(_ forMe: String) {
        
        dream = forMe
    }
}


var personSet = PersonSet(name: "P", dream: "A")

print("N: \(personSet.name) D: \(personSet.dream)")

personSet.newDream("NewDream")


print("N: \(personSet.name) D: \(personSet.dream)")
