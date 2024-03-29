//
//  UserWatcherView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 28/2/23.
//

import SwiftUI

struct URLWatcher: AsyncSequence, AsyncIteratorProtocol {
    
    typealias Element = Data
    
    let url:URL
    let delay:Int
    private var comparisonData:Data?
    private var isActive = true
    
    init(url:URL, delay:Int = 10) {
        self.url = url
        self.delay = delay
    }
    
    mutating func next() async throws -> Element? {
        //One we're inactive always return nil immediately
        guard isActive else { return nil }
        
        if comparisonData == nil {
            //If this is our first iteration return the initial value
            comparisonData = try await fetchData()
        } else {
            //Otherwise, sleep for a while and see if our data changed
            while true {
                try await Task.sleep(for: .seconds(UInt64(delay) * 1))
                let latestData = try await fetchData()
                
                if latestData != comparisonData {
                    //New data is different from preious data, so update previous data and send it back
                    comparisonData = latestData
                    break
                }
            }
        }
        
        if comparisonData == nil {
            isActive = false
            return nil
        } else {
            return comparisonData
        }
    }
    func fetchData() async throws -> Element {
        let (data,_) = try await URLSession.shared.data(from: url)
        return data
    }
    
    func makeAsyncIterator() -> URLWatcher {
        self
    }
    
}


private struct UserWatcher: Identifiable, Decodable {
    let id:Int
    let name:String
    
}

struct URLWatcherView: View {
    @State private var users = [UserWatcher]()
    
    var body: some View {
        List(users) { user in
            Text(user.name)
        }
        .task {
            // continuosly check the URL watcher for data
            await fetchUsers()
        }
    }
    
    func fetchUsers() async {
        let url = URL(fileURLWithPath: "/Users/adrian/Desktop/xCode/HWSPlus/Usuarios.json")
        let urlWatcher = URLWatcher(url: url, delay: 3)
        
        do {
            for try await data in urlWatcher {
                try withAnimation {
                    users = try JSONDecoder().decode([UserWatcher].self, from: data)
                }
            }
        } catch {
            //just bail out
        }
    }
}



struct URLWatcherView_Previews: PreviewProvider {
    static var previews: some View {
        URLWatcherView()
    }
}

