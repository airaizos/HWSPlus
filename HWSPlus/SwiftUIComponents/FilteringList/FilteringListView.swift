//
//  FilteringListView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 8/1/23.
/// **DidSet no funciona en SwiftUI**


import SwiftUI

struct FilteringListView: View {
    let users = Bundle.main.decode([User].self, from: "users.json")
    
    var body: some View {
        NavigationView {
            FilteringList(users, placeholder: "Busca aquí", filterKeys: \.name, \.address, \.phone, \.company, \.email) { user in
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.headline)
                    Text(user.company)
                        .font(.callout)
                    Text(user.address)
                        .foregroundColor(.secondary)
                    Text(user.phone)
                        .foregroundColor(.secondary)
                    Text(user.email)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("Address Book")
    }
}

struct FilteringListView_Previews: PreviewProvider {
    static var previews: some View {
        FilteringListView()
    }
}
