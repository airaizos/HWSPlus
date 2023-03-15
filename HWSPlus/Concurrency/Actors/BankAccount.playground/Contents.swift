import Foundation


///**Clases sin actores**. Pueden causar múltiples errores al acceder a los métodos concurrentemente
final class BankAccount {
    var balance: Decimal
    let number:Int32
    
    init(initialBalance:Decimal,number:Int32) {
        self.balance = initialBalance
        self.number = number
    }
    
    func deposit(amount:Decimal) {
        balance = balance + amount
    }
    
    func transfer(amount:Decimal, to other: BankAccount) {
        guard balance > amount else{ return }
        balance = balance - amount
        other.deposit(amount: amount)
    }
}

let firstAccount = BankAccount(initialBalance: 1_000, number: 123)
let secondAccount = BankAccount(initialBalance: 2_000, number: 789)


secondAccount.transfer(amount: 250, to: firstAccount)

print("balance: ",firstAccount.balance,", number:", firstAccount.number)
print("balance: ",secondAccount.balance,", number:", secondAccount.number)


///**Utilizando actores**

actor BankAccountActor {
    var balance:Decimal
    let number:String
    
    init(initialBalance:Decimal, number:String) {
        self.balance = initialBalance
        self.number = number
    }
    
    func deposit(amount:Decimal) {
        balance = balance + amount
    }
    
    // Se marca como async la función que opera sobre un actor
    func transfer(amount:Decimal, to other: BankAccountActor) async {
        guard balance > amount else{ return }
        balance = balance - amount
        //Await para que permita utilizar los métodos
        await other.deposit(amount: amount)
    }
}


let actorAccount = BankAccountActor(initialBalance: 100, number: "Primera")
let actor2Account = BankAccountActor(initialBalance: 987, number: "Segunda")

Task {
    await actorAccount.transfer(amount: 12, to: actor2Account)
    
    await print("Number",actorAccount.number,"Balance: ",actorAccount.balance)
    await print("Number",actor2Account.number,"Balance: ",actor2Account.balance)

}
