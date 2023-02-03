//
//  HoveringLabelsView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 3/2/23.
//

import SwiftUI

struct HoveringLabelsView: View {
    var body: some View {
        ZStack {
            Color.pps3
            VStack {
                ShowingLabel(labelStyle: ShowingLabelStyle.self) {
                    Text("Basketball")
                } icon: {
                    Image(systemName: "basketball")
                }
                
                ShowingLabel(labelStyle: ShowingInvertedLabelStyle.self) {
                    Text("Tennis")
                } icon: {
                    Image(systemName: "tennisball")
                }
                
                ShowingLabel(labelStyle: ShowingVerticalLabelStyle.self) {
                    Text("Football")
                } icon: {
                    Image(systemName: "football")
                }
                
                ShowingLabel(labelStyle: ShowingVerticalInvertedLabelStyle.self) {
                    Text("Soccer")
                } icon: {
                    Image(systemName: "soccerball")
                }
               
            }
         
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HoveringLabelsView_Previews: PreviewProvider {
    static var previews: some View {
        HoveringLabelsView()
    }
}
