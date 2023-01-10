//
//  AccessibleStackView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 10/1/23.
//

import SwiftUI

struct AccessibleStackView: View {
    var body: some View {
        AccessibleStack( horizontalSpacing: 50, verticalSpacing: 50) {
            
            Text("Etiqueta Número 1")
            Text("Etiqueta Número 2")
        }
    }
}

struct AccesibleStackView_Previews: PreviewProvider {
    static var previews: some View {
        AccessibleStackView()
    }
}
