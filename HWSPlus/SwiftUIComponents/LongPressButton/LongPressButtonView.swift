//
//  LongPressButtonView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 10/1/23.
//

import SwiftUI

struct LongPressButtonView: View {
    @State private var activated = false
    
    
    var body: some View {
        VStack {
            Text(activated ? "Activado" : "Desactivado")
                .font(.largeTitle)
                .foregroundColor(activated ? .red : .gray.opacity(0.5))
            LongPressButton(image: activated ?  Image(systemName: "bolt") : Image(systemName: "bolt.fill"),foregroundColor: activated ? .yellow : .gray)  {
                activated.toggle()
            }
          
        }
    }
}

struct LongPressButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LongPressButtonView()
    }
}
