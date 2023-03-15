//
//  ActorHopping.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 9/3/23.
//

import SwiftUI


struct UserA: Identifiable {
    let id:Int
}

actor Database {
    func loadUser(id: Int) -> UserA {
        UserA(id: id)
    }
}



@MainActor
class DataModel:ObservableObject{
    @Published var users = [UserA]()
    var database = Database()
   
    func loadUsers() async {
        for i in 1...100 {
            let user = await database.loadUser(id: i)
            users.append(user)
        }
    }
    
    
}

///#Forma más eficiente. Idéntico al anterior
actor DataBaseB {
    func loadUsers(ids: [Int]) -> [UserA] {
        ids.map { UserA(id: $0) }
    }
}

@MainActor
class DataModelB: ObservableObject {
    @Published var users = [UserA]()

    var database = DataBaseB()
    func loadUsers() async {
        let ids = Array(101...200)
        let newUsers = await database.loadUsers(ids: ids)
        users.append(contentsOf: newUsers)
    }
}

struct ActorHopping: View {
    @StateObject var model = DataModel()
    @StateObject var modelB = DataModelB()
    var body: some View {
        VStack {
            List(model.users) { user in
                Text("User: \(user.id)")
            }
            
            .task {
                await model.loadUsers()
            }
            
            List(modelB.users) { user in
                Text("User B : \(user.id)")
            }
            .task {
                await modelB.loadUsers()
            }
        }
    }
}

struct ActorHopping_Previews: PreviewProvider {
    static var previews: some View {
        ActorHopping()
    }
}



