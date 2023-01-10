//
//  FilteringListUsersView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 8/1/23.
//

import SwiftUI

struct FilteringListUsersView: View {
    let users = Bundle.main.decode([User].self, from: "users.json")
    
    @State private var filteredItems = [User]()
    @State private var filterString = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Type to filter", text: $filterString.onChange(applyFilter))
                    .textFieldStyle((RoundedBorderTextFieldStyle()))
                    .padding(.horizontal)
                List(filteredItems) { user in
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.address)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .onAppear(perform: applyFilter)
        }
        .navigationTitle("Address Book")
    }
    
    func applyFilter() {
        //Quitar espacios blancos
        let cleanedFilter = filterString.trimmingCharacters(in: .whitespacesAndNewlines)
        if cleanedFilter.isEmpty {
            filteredItems = users
        } else {
            filteredItems = users.filter { $0.name.localizedCaseInsensitiveContains(cleanedFilter)}
        }
    }
    
}

struct FilteringListUsersView_Previews: PreviewProvider {
    static var previews: some View {
        FilteringListUsersView()
    }
}
