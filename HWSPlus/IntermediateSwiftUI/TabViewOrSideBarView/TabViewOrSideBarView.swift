//
//  TabViewOrSideBarView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 5/2/23.
//

import SwiftUI

struct TabViewOrSideBarView: View {
    
    let sfSymbols: [TitledView] = [
        TitledView(title: "Home", systemImage: "house", view: Text("Home")),
        TitledView(title: "Bicycle", systemImage: "bicycle", view: Text("Bicyle")),
        TitledView(title: "Account", systemImage: "person.circle", view: Text("Account")),
        ]
    
    let bundle: [TitledView] = [
        TitledView(title: "Kimono", imageName: "kimono", view: Text("Kimono")),
        TitledView(title: "Bicycle", imageName: "bicycle40", view: Text("Bicyle")),
        TitledView(title: "Plank", imageName: "plank", view: Text("Plank")),
        TitledView(title: "Swimming", imageName: "swimming", view: Text("Swimming")),
    
    ]
    
    //TODO: Ajustar tamaño del icono
    var body: some View {
        TabbedSidebar(content: bundle)
    }
}

struct TabViewOrSideBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewOrSideBarView()
    }
}
