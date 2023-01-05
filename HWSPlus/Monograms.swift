//
//  Monograms.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 3/1/23.
//

import SwiftUI

struct MonogramView: View {
    
    
    private struct Circlemonogram<Content: View>: View {
        var content: Content
        
        var body: some View {
            content
                .font(.system(.largeTitle, design: .rounded))
                .padding()
                .background(Color.cyan)
                .clipShape(Circle())
        }
    }
    
    let name: String
    
    func makeGenericMonogram() -> some View {
        Circlemonogram(content: Image(systemName: "person.fill"))
    }
    
    func makePreciseMonogram(for name: String) -> some View {
        Circlemonogram(content: Text(name))
    }
    
    func makeMonogram() -> some View {
        let formatter = PersonNameComponentsFormatter()
        
        if let components = formatter.personNameComponents(from: name) {
            formatter.style = .abbreviated
            let abbreviateName =  formatter.string(from: components)
            
            if abbreviateName.count == 2 {
                return AnyView(makePreciseMonogram(for: abbreviateName))
            }
        }
        return AnyView(makeGenericMonogram())
    }
    
    var body: some View {
        makeMonogram()
    }
    
}


struct Monograms: View {
    let nombre = "paul".givenName
    var body: some View {
        List {
            MonogramView(name: "Adrián Iraizos")
            MonogramView(name: "Adele Adkins")
            MonogramView(name: "James Clear")
            MonogramView(name: "Chuy")
            MonogramView(name: "Hudson, Paul")
            MonogramView(name: "TheRock")
            MonogramView(name: nombre)
        }
       
    }
}

struct Monograms_Previews: PreviewProvider {
    static var previews: some View {
        Monograms()
    }
}

extension String {
    var givenName: String {
   //     let formatter = PersonNameComponentsFormatter()
        
        var components = PersonNameComponents()
        components.givenName = self
        
        return components.givenName ?? ""
    }
    
}
