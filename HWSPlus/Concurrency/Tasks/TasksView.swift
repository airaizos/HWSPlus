//
//  TasksView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 1/3/23.
//
///**Aquí pueden estar pasando varias cosas**
///Toda la UI se ejeucta en el hilo principal, así que la acción del botón se dispara en el hilo principal.
///Aunque la tarea se crea en el hilo principal, el trabajo se ejecutará en un hilo en segundo plano.
///Dentro del método 'loadMessages()' usamps 'await' así que se descarga el d ato de la url, y caundo se reanuda podríamos tener otro cambio de hilo, puede que en el mismo hilo en segundo plano o en otro.
///'Messages' usa el *property wrapper* '@State' que automaticamente actualiza su valor en el hilo principal. Así que aunque se asigne al hilo en segundo plano, actualizar el valor lo devuelve al hilo principal


import SwiftUI

private struct MessageTask: Decodable, Identifiable {
    let id:Int
    let from:String
    let text:String
}

struct TasksView: View {
    @State private var messages = [MessageTask]()
    var body: some View {
        NavigationView {
            
            Group {
                if messages.isEmpty {
                    Button("Load Messages") {
                        Task {
                            await loadMessages()
                        }
                    }
                } else {
                    List(messages) {  message in
                        VStack(alignment: .leading) {
                            Text(message.from)
                                .font(.headline)
                            
                            Text(message.text)
                        }
                    }
                }
            }
            .navigationTitle("Inbox")
        }
    }
    func loadMessages() async {
        do {
            let url = URL(string: "http://hws.dev/messages.json")!
            let (data,_) = try await URLSession.shared.data(from: url)
            messages = try JSONDecoder().decode([MessageTask].self, from: data)
        } catch {
            messages = [ MessageTask(id: 0, from: "Failed to load inbox", text: "Please try again later")]
        }
    }
    
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
