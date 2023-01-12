//
//  RadialMenuView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 12/1/23.
//

import SwiftUI

struct RadialMenuView: View {
    
    /// Variable calculada porque no se puede referenciar parte struct desde otra mientras se está creando
    var buttons: [RadialButton] {
        [RadialButton(label: "Photo", image: Image(systemName: "photo"), action: photoTapped),
        RadialButton(label: "Video", image: Image(systemName: "video"), action: videoTapped),
        RadialButton(label: "Doc", image: Image(systemName: "doc"), action: documentTapped),
        RadialButton(label: "Note", image: Image(systemName: "note"), action: noteTapped)
         ]
    }
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color.black
                .edgesIgnoringSafeArea(.all)
            RadialMenu(title: "Attach...", closedImage: Image(systemName: "ellipsis.circle"), openImage: Image(systemName: "multiply.circle.fill"), buttons: buttons, animation: .interactiveSpring(response: 0.4, dampingFraction: 0.6))
                .offset(x: -20, y: -20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func photoTapped() {
        print("Photo tapped")
    }
    func videoTapped() {
        print("Video tapped")
    }
    func documentTapped() {
        print("Doc tapped")
    }
    func noteTapped() {
        print("Note tapped")
    }
    
}

struct RadialMenuView_Previews: PreviewProvider {
    static var previews: some View {
        RadialMenuView()
    }
}
