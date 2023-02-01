//
//  NeunorphismView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 1/2/23.
//

import SwiftUI

struct NeunorphismView: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.offWhite
                ScrollView {
                    Color.offWhite
                    HStack(spacing: 20) {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.offWhite)
                            .frame(width: 150, height: 150)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.2), radius: 10, x: -5, y: -5)
                        
                        Button(action: {
                            print("Button tapped")
                        }) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.gray)
                        }
                        .buttonStyle(SimpleButtonStyle())
                        
                        
                        Button(action: {
                            print("V2 tapped")
                        }) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.gray)
                        }
                        .buttonStyle(SimpleV2ButtonStyle())
                    }
                    HStack {
                        ZStack {
                            LinearGradient(Color.darkStart, Color.darkEnd)
                                .frame(height: 150)
                            Button(action: {
                                print("darkButton")
                            }) {
                                Image(systemName: "phone.fill")
                                    .foregroundColor(.white)
                            }
                            .buttonStyle(DarkButtonStyle())
                        }
                    }
                }
          
            }
            
            .navigationTitle("Neumorphism")
            
        }
        .ignoresSafeArea()
    }
    
}

struct NeunorphismView_Previews: PreviewProvider {
    static var previews: some View {
        NeunorphismView()
    }
}
