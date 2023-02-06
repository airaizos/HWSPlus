//
//  TitledView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 5/2/23.
//

import SwiftUI

struct TitledView {
    
    let title : String
    let icon: Image
    let view: AnyView
    
    /// This initializer will be generic over some kind of view so that we can perform the type erasure here rather than everywhere we need to make a TitledView
    init<T: View>(title: String, systemImage: String, view: T) {
        self.title = title
        self.icon = Image(systemName: systemImage)
        self.view = AnyView(view)
    }
    
    init<T: View>(title: String, imageName: String, view: T) {
        self.title = title
        self.icon = Image(imageName)
        self.view = AnyView(view)
    }
    
}

struct TabbedSidebar: View {
    @Environment(\.horizontalSizeClass)  var sizeClass
    @State private var selection: String? = ""
    
    private let views: [TitledView]
    
    var body: some View {
        if sizeClass == .compact {
            TabView(selection: $selection) {
                ForEach(views, id:\.title) { item in
                    item.view
                        .tabItem {
                            Text(item.title)
                            item.icon
                        }
                        .tag(item.title)
                      
                }
            }
        } else {
            NavigationView{
                List(selection: $selection) {
                    ForEach(views, id: \.title) { item in
                        NavigationLink(destination: item.view, tag: item.title, selection: $selection) {
                            Label {
                                Text(item.title)
                            } icon:  {
                                item.icon
                                   
                            }
                            .labelStyle(NavigationListLabelStyle())
                        }
                        .tag(item.title)
                    }
                }
                .listStyle(SidebarListStyle())
            }
        }
    }
    
    init(content: [TitledView]) {
        views = content
        
        _selection = State(wrappedValue: content[0].title)
    }
}


struct NavigationListLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.title
            configuration.icon
             /*   .minimumScaleFactor(0.4)
                .scaleEffect(0.5)
                .fixedSize(horizontal: true, vertical: true)
                .controlSize(.mini)
                .imageScale(.small)
                .scaledToFit()
                .frame(maxWidth: 40, maxHeight: 40)
              */
        }
        //.frame(width: 44)
    }
}
