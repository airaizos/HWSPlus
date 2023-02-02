//
//  NeunorphismView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 1/2/23.
//

import SwiftUI

struct NeumorphismView: View {
    @State private var isToggle = false
    
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
                    ZStack {
                        LinearGradient(Color.darkStart, Color.darkEnd)
                            .frame(height: 150)
                        HStack {
                            
                            Button(action: {
                                print("darkButton")
                            }) {
                                Image(systemName: "phone.fill")
                                    .foregroundColor(.gray)
                            }
                            .buttonStyle(DarkButtonStyle())
                            
                            Button(action: {
                                print("pillow Button")
                                
                            }) {
                                Image(systemName: "phone.down.fill")
                                    .foregroundColor(.white)
                            }
                            .buttonStyle(DarkButtonV2Style())
                            
                            Button(action: {
                                print("DarkBackgroundV3")
                            }) {
                                Image(systemName: "phone.arrow.right.fill")
                                    .foregroundColor(.black)
                            }
                            .buttonStyle(DarkButtonV3Style())
                            
                            Toggle(isOn: $isToggle) {
                                Image(systemName: "phone.down.waves.left.and.right")
                                    .foregroundColor(isToggle ? .gray : .white)
                            }
                            .toggleStyle(DarkToggleStyle())
                        }
                    }
                    ZStack {
                        LinearGradient(Color.darkStart, Color.darkEnd)
                            .frame(height: 150)
                        HStack {
                            Button(action: {
                                print("Colorful button")
                            }) {
                                Image(systemName: "figure.jumprope")
                            }
                            .foregroundColor(.white)
                            
                            .buttonStyle(ColorfulButtonStyle())
                            Toggle(isOn: $isToggle) {
                                Image(systemName: "dumbbell.fill")
                                    .foregroundColor(isToggle ? .lightEnd : .white)
                            }
                            .toggleStyle(ColorfulToggleStyle())
                        }
                    }
                }
                
            }
            
            .navigationTitle("Neumorphism")
            
        }
        .ignoresSafeArea()
    }
    
}

struct NeumorphismView_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphismView()    }
}
