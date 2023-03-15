//
//  JokeTaskView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 2/3/23.
//

import SwiftUI

struct JokeTaskView: View {
    @State private var jokeText = ""
    
    var body: some View {
        VStack {
            Text(jokeText)
            Button("Fetch new joke", action: fetchJoke)
        }
    }
    
    func fetchJoke() {
        Task {
            let url = URL(string: "https://icanhazdadjoke.com")!
            var request = URLRequest(url: url)
            request.setValue("Swift Concurrency by Example", forHTTPHeaderField: "User-Agent")
            request.setValue("text/plain", forHTTPHeaderField: "Accept")
            let (data,_) = try await URLSession.shared.data(for: request)
            if let jokeString = String(data: data, encoding: .utf8) {
                jokeText = jokeString
            } else {
                jokeText = "Fail joke"
            }
        }
    }
}

struct JokeTaskView_Previews: PreviewProvider {
    static var previews: some View {
        JokeTaskView()
    }
}
