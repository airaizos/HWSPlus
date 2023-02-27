//
//  ContentView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 15/12/22.
//

import SwiftUI

struct ContentView: View {
  
    let monitor = NetworkMonitor()
    
    var body: some View {
        
        ///#Algoritmos#
        /// FloodFillView()
        ///BoidsView()
        ///FilteringListView()
        
        ///#Swift Components
        ///ShapeBezierView()
        /// LongPressButtonView()
        /// FlipCardView()
        ///AccessibleStackView()
        /// StretchingHeaderView()
        ///  StretchingMarginView()
        /// RadialMenuView()
        ///  RemoteImageView()
        
        ///#IntermediateSwiftUI
        ///  CustomPropertyWrapperWithDynamicProperty()
        ///      ButtonCustomizationButtonStyle()
        ///    NeumorphismView()
        ///    AdvancedButtonsView()
        ///    AnimatingButtonView()
        ///   PrimitiveButtonView()
        ///CheckToggleView()
        ///   ProgressViewStyleView()
        ///LabelStyleView()
        ///    TabViewOrSideBarView()
        ///   ParticlesView()
        
        ///#Accelerometer#
        ///  AccelerometerView()
        /// LayeringShadowsView()
        
        ///#Networking
        /// CodableAndCombineView()
        ///   NetworkMonitorView().environmentObject(monitor)
        ///NetworkUploadingView()
        /// NetworkCombiningView()
        /// ChainedNetworkView()
        
        /// #Advanced Swift
        ///   StringInterpolationView()
        
        ///     Page29View()
        /// Page30View()
        AsyncPropertyView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
