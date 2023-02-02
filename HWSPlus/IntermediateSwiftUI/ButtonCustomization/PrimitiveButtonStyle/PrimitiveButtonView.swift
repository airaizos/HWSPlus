//
//  PrimitiveButtonView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 2/2/23.
//

import Combine
import SwiftUI

struct PrimitiveButtonView: View {
    
   
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                HStack {
                    Button {
                        print("Button Style")
                    } label: {
                        Image(systemName: "hexagon.fill")
                            .font(.largeTitle)
                    }
                    .buttonStyle(ExampleButtonStyle())
                    
                    Button {
                        print("Primitive Style")
                    } label : {
                        Image(systemName: "hexagon")
                            .font(.largeTitle)
                    }
                    .buttonStyle(ExamplePrimitiveButtonStyle())
                }
                HStack {
                    Button {
                        print("Pressed")
                    } label: {
                        Image(systemName: "pentagon.fill")
                    }
                    .buttonStyle(CustomButtonType())
                    
                    Button {
                        print("Launching!")
                    } label:{
                        Image(systemName: "airplane.departure")
                            .font(.largeTitle)
                    }
                    .buttonStyle(CancellableButtonStyle())
                }
            }
            .navigationTitle("Primitive Style")
        }
    }
}

struct PrimitiveButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PrimitiveButtonView()
    }
}
