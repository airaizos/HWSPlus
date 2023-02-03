//
//  LabelStyleView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 3/2/23.
//

import SwiftUI

struct LabelStyleView: View {
    var body: some View {
        VStack{
            Label("Football", systemImage: "football.fill")
            Label {
                Text("Soccer")
            } icon: {
                Image(systemName: "soccerball")
            }
            .labelStyle(IconOnlyLabelStyle())
            
            Label {
                Image(systemName: "tennisball")
                    .foregroundColor(.green)
            } icon: {
                Text("Tennis")
            }
            .labelStyle(TitleOnlyLabelStyle())
        
            Label {
                Text("volleyball")
            } icon: {
                Image(systemName: "volleyball")
            }
            .labelStyle(VerticalLabelStyle())
            
            HoveringLabel(labelStyle: VerticalRevealingLabelStyle.self) {
                Text("Basketball")
            } icon: {
                Image(systemName: "basketball")
            }
            HoveringLabel(labelStyle: HighlightingLabelStyle.self) {
                Text("Criket")
            } icon: {
                Image(systemName: "cricket.ball")
            }
        }
        .foregroundColor(Color.accentColor)
        .font(.system(size: 50, weight: .bold))
    }
}

struct LabelStyleView_Previews: PreviewProvider {
    static var previews: some View {
        LabelStyleView()
    }
}
