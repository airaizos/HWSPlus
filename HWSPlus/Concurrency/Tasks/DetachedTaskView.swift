//
//  DetachedTaskView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 1/3/23.
//

import SwiftUI

private class ViewModel: ObservableObject {
    @Published var name = "¡Hola!"
}

private class NewViewModel: ObservableObject {}

struct DetachedTaskView: View {
    @State private var name = "Anónimo"
    @StateObject private var model = ViewModel()
    @StateObject private var newModel = NewViewModel()
    @State private var count = 1
    
    var body: some View {
        VStack {
            Text("Hello \(name)!")
            Button("Authenticate Task") {
                // Sin sentido porque @State lo manda al hilo principal
                Task {
                    name = "Taylor"
                }
            }
            //Main actor-isolated property 'name' can not be mutated from a Sendable closure
            /*
            Button("Authenticate Task.Detached") {
                Task.detached {
                    name = "Taylor Detached"
                }
            }
            */
            Image(systemName: "moon")
                .font(.headline)
                .foregroundColor(.pps8)
                
                      Text("Hola \(model.name)!")
            Button("Autentificate") {
                Task {
                    model.name = "Taylor con StateObject"
                }
            }
                //Main actor-isolated property 'model' can not be mutated from a Sendable closure
                /*
                Button("Autentificate Detached") {
                    Task.detached {
                        model.name = "Taylor con StateObject y TaskDetached"
                    }
                 */
            Image(systemName: "sun.min")
                .font(.headline)
            
            Button("otra vez", action: doWork)
                .padding(.all, 10.0)
                .frame(width: 30.0)
            
      //      Image("spiral")
        //        .scaledToFill()
          //      .frame(width:50)
            
            Text("^[\(count) persona](inflect:true)")
            Button("add", action: addPerson)
            Button("remove", action: removePerson)
        }
        
    }
    func addPerson() {
        count += 1
    }
    
    func removePerson() {
        count -= 1
    }
    
    func doWork() {
        //Se ejecutan secuencialmente
        Task {
            for i in 1...10 {
                print("TASK 1: \(i)")
            }
        }
        Task {
            for i in 51...10 {
                print("TASK 2: \(i)")
            }
        }
    }
    func doWorkDetached() {
        //Se ejecutan al mismo tiempo
        Task.detached {
            for i in 1...10 {
                print("TASK 1: \(i)")
            }
        }
        Task.detached {
            for i in 51...10 {
                print("TASK 2: \(i)")
            }
        }
    }
}

struct DetachedTaskView_Previews: PreviewProvider {
    static var previews: some View {
        DetachedTaskView()
    }
}
