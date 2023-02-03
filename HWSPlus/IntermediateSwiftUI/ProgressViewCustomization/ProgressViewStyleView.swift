//
//  ProgressViewStyleView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 3/2/23.
//

import SwiftUI

struct ProgressViewStyleView: View {
    @State private var progress = 0.2
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(spacing: 0) {
                        ProgressView("Default", value: progress, total: 1.0)
                            .frame(height: 100)
                        ProgressView("Gauge", value: progress, total: 1.0)
                            .frame(height: 300)
                            .progressViewStyle(GaugeProgressStyle())
                        
                        ProgressView("Challenge 1", value: progress, total: 1)
                            .frame(height: 300)
                            .progressViewStyle(GaugeProgressStyleCh1(strokeColor: Color.blue, image: Image(systemName: "box.truck")))
                        
                        ProgressView("Challenge 2", value: progress, total: 1)
                            .frame(height: 300)
                            .progressViewStyle(GaugeProgressStyleCh2())
                        
                        ProgressView("Challenge 3", value: progress, total: 1)
                            .frame(height: 300)
                            .progressViewStyle(GaugeProgressStyleCh2(strokeColor: Color.red.opacity(0.5), strokeColorF: Color.yellow, image: Image(systemName: "figure.roll")))
                        
                        ProgressView("Challenge 4", value: progress, total: 1)
                            .frame(height: 300)
                            .progressViewStyle(GaugeProgressStyleCh3())
                    }
                }
                
            }
            HStack {
                Button {
                    if progress <= 0.99 {
                        progress += 0.2
                        print(progress)
                    }
                } label: {
                    Image(systemName: "plus")
                        .font(.largeTitle)
                }
                Button {
                    if progress >= 0.2 {
                        progress -= 0.2
                        print(progress)
                    }
                } label: {
                    Image(systemName: "minus")
                        .font(.largeTitle)
                }
            }
            
        }
        .navigationTitle("ProgressView")
    }
}


struct ProgressViewStyleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViewStyleView()
    }
}
