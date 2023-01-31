//
//  CustomPropertyWrapperWithDynamicProperty.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 31/1/23.
/// #Crear a property Wrapper#
///https://www.hackingwithswift.com/plus/intermediate-swiftui/creating-a-custom-property-wrapper-using-dynamicproperty
/// leer y escribir documents desde el app container

import SwiftUI


@propertyWrapper struct Document: DynamicProperty {
    @State private var value = ""
    private let url: URL
    
    
    /// cuando leamos sólo devolverá el valor, cuando escribamos guardará el archivo, y después actualizará el valor
    var wrappedValue: String {
        get {
            value
        }
        nonmutating set {
            do {
                try newValue.write(to: url, atomically: true, encoding: .utf8)
                
                value = newValue
                assert(value == newValue, "Nuevo Valor guardado: \(newValue)")
            } catch {
                assertionFailure("Faile to write output")
            }
        }
    }
    /// **@State** property wrapper usa projectedValue para crear un Binding para sus datos.
    var projectedValue: Binding<String> {
        Binding(
            get: { wrappedValue },
            set: { wrappedValue = $0 }
        )
    }
    
    init(_ filename: String) {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        url = paths.first!.appendingPathComponent(filename)
        let initialText = (try? String(contentsOf: url)) ?? ""
        _value = State(wrappedValue: initialText)
    }
}

struct CustomPropertyWrapperWithDynamicProperty: View {
    @Document("test.txt") var document
    
    
    var body: some View {
        NavigationView {
            VStack{
                Text(document)
                    .font(.largeTitle)
                    .foregroundColor(.cyan)
                
                TextEditor(text: $document)
                Button("Change document") {
                    document = String(Int.random(in: 1...1000))
                }
            }
            .navigationTitle("SimpleText")
        }
    }
}

struct CustomPropertyWrapperWithDynamicProperty_Previews: PreviewProvider {
    static var previews: some View {
        CustomPropertyWrapperWithDynamicProperty()
    }
}


/// Challenges

///Rather than have our binding write to disk every time a single character is changed, can you write code that simply sets a dirty flag and handle the writing at a later date? This might be periodically using Timer, or perhaps even by detecting the app moving to the background.
///Can you think of a way for our property wrapper to detect external changes, and reload itself in that case? For example, if someone else modifies the file, our wrapper should detect that and load the modified file. This might be as simple as a timer checking when the file was last modified.

