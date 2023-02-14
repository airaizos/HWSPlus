//
//  StringInterpolationView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 14/2/23.
//

import SwiftUI

struct StringInterpolationView: View {
    let signedValuesExample = SignedValues()
    let joinedArrayStrings = ArrayStringsJoined()
    let dateStringInterpolation = DateStringInterpolation()
    let repeatingString = RepeatingStringInterpolation()
    let encodableClass = EncodableStringInterpolation()
    let urlStringInterpolation = URLStringInterpolation()
    let operationStringInterpolation = OperationStringInterpolation()
    @State var hovering = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Label {
                        Text("Añadir un carácter")
                            .font(.system(.headline, design: .monospaced))
                    } icon: {
                        Image(systemName: "star")
                    }
                    .foregroundColor(.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(5)
                    .background(Color.blue.opacity(0.1))
                    
                    Text(signedValuesExample.temp)
                        .foregroundColor(.gray)
                        .font(.system(.callout, design: .rounded))
                }
                HStack(alignment: .bottom) {
                    Label {
                        Text("Array de Strings")
                            .font(.system(.headline, design: .monospaced))
                    } icon: {
                        Image(systemName: "list.bullet.indent")
                    }
                    .foregroundColor(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(5)
                    .background(Color.yellow.opacity(0.1))
                    
                    Text(joinedArrayStrings.companions)
                        .foregroundColor(.gray)
                        .font(.system(.callout, design: .rounded))
                }
                HStack(alignment: .bottom) {
                    Label {
                        Text("Fecha-Hora")
                            .font(.system(.headline, design: .monospaced))
                    } icon: {
                        Image(systemName: "list.dash")
                    }
                    .foregroundColor(.classicRed)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(5)
                    .background(Color.yellow.opacity(0.1))
                    
                    Text(dateStringInterpolation.fecha)
                        .foregroundColor(.gray)
                        .font(.system(.callout, design: .rounded))
                }
                HStack(alignment: .bottom) {
                    Label {
                        Text("Repeating String")
                            .font(.system(.headline, design: .monospaced))
                    } icon: {
                        Image(systemName: "music.note.list")
                    }
                    .foregroundColor(.classicBlue)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(5)
                    .background(Color.yellow.opacity(0.1))
                    
                    Text(repeatingString.example)
                        .foregroundColor(.gray)
                        .font(.system(.callout, design: .rounded))
                    Text(repeatingString.example2)
                        .foregroundColor(.gray)
                        .font(.system(.callout, design: .rounded))
                }
                HStack(alignment: .bottom) {
                    Label {
                        Text("Class")
                            .font(.system(.headline, design: .monospaced))
                    } icon: {
                        Image(systemName: "list.dash.header.rectangle")
                    }
                    .foregroundColor(.classicGreen)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(5)
                    .background(Color.yellow.opacity(0.1))
                    
                    Text(encodableClass.example)
                        .foregroundColor(.gray)
                        .font(.system(.callout, design: .rounded))
                   
                }
                HStack(alignment: .bottom) {
                    Label {
                        Text("URL")
                            .font(.system(.headline, design: .monospaced))
                    } icon: {
                        Image(systemName: "list.bullet.circle.fill")
                    }
                    .foregroundColor(.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(5)
                    .background(Color.yellow.opacity(0.1))
                    
                    Text(urlStringInterpolation.example)
                        .foregroundColor(.gray)
                        .font(.system(.callout, design: .rounded))
                   
                }
                HStack(alignment: .bottom) {
                    Label {
                        Text("Operations")
                            .font(.system(.headline, design: .monospaced))
                    } icon: {
                        Image(systemName: "checklist")
                    }
                    .foregroundColor(.mint)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(5)
                    .background(Color.yellow.opacity(0.1))
                    Group {
                        Text(operationStringInterpolation.example)
                        Text(operationStringInterpolation.example2)
                        Text(operationStringInterpolation.example3)
                    }
                    .foregroundColor(.gray)
                    .font(.system(.callout, design: .rounded))
                }
            }
                .navigationTitle("String Interpolation")
        }
    }
}

struct StringInterpolationView_Previews: PreviewProvider {
    static var previews: some View {
        StringInterpolationView()
    }
}
