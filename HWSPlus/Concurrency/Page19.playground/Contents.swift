import Foundation

// Función sincrona

func randomD6() -> Int {
    Int.random(in: 1...6)
}

let result = randomD6()
print(result)

//Función asincrona

func randomD6() async -> Int {
    Int.random(in: 1...6)
}
let resultA = await randomD6()
print(resultA)
