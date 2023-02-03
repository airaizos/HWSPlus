//
//  ProgressViewStyleView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 3/2/23.
//

import SwiftUI


struct GaugeProgressStyle: ProgressViewStyle {
    
    var trimAmount = 0.75
    var strokeColor = Color.pps4
    var strokeColorF = Color.pps8
    var strokeWidth = 25.0
    
    let formatter = NumberFormatter()
    
    var rotation: Angle {
        Angle(radians: .pi * (1 - trimAmount)) + Angle(radians:  .pi / 2)
    }
    
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        formatter.numberStyle = .percent
        let percentage = formatter.string(from: fractionCompleted as NSNumber) ?? "0%"
        
        return ZStack {
            Circle()
                .rotation(rotation)
                .trim(from: 0, to: CGFloat(trimAmount))
                .stroke(strokeColor, style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
            
            Circle()
                .rotation(rotation)
                .trim(from: 0, to: CGFloat(trimAmount) * CGFloat(fractionCompleted))
                .stroke(strokeColorF.opacity(0.9), style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
            
            Text(percentage)
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .offset(y: -5)
                .foregroundColor(strokeColorF)
                .animation(nil, value: 0)
            
        }
    }
}

// MARK: Challenge 1

struct GaugeProgressStyleCh1: ProgressViewStyle {
    
    var trimAmount = 0.75
    var strokeColor = Color.pps4
    var strokeColorF = Color.pps8
    var strokeWidth = 25.0
    var image = Image(systemName: "bicycle")
    let formatter = NumberFormatter()
    
    var rotation: Angle {
        Angle(radians: .pi * (1 - trimAmount)) + Angle(radians:  .pi / 2)
    }
    
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        formatter.numberStyle = .percent
        let percentage = formatter.string(from: fractionCompleted as NSNumber) ?? "0%"
        
        
        return VStack {
            ZStack {
                Circle()
                    .rotation(rotation)
                    .trim(from: 0, to: CGFloat(trimAmount))
                    .stroke(strokeColor, style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
                
                Circle()
                    .rotation(rotation)
                    .trim(from: 0, to: CGFloat(trimAmount) * CGFloat(fractionCompleted))
                    .stroke(strokeColorF.opacity(0.9), style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
                
                Text(percentage)
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .offset(y: -20)
                    .foregroundColor(strokeColorF)
                    .animation(nil, value: 0)
            }
            image
                .frame(width: 20)
                .foregroundColor(strokeColorF)
                .font(.system(size: 50))
                .offset(y: -78)
            
            
        }
    }
}

// MARK: Challenge 2
struct GaugeProgressStyleCh2: ProgressViewStyle {
    
    var trimAmount = 0.75
    var strokeColor = Color.pps4
    var strokeColorF = Color.pps8
    var strokeWidth = 25.0
    var image = Image(systemName: "bicycle")
    let formatter = NumberFormatter()
    
    var rotation: Angle {
        Angle(radians: .pi * (1 - trimAmount)) + Angle(radians:  .pi / 2)
    }
    
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        formatter.numberStyle = .percent
        let percentage = formatter.string(from: fractionCompleted as NSNumber) ?? "0%"
        
        
        return VStack {
            ZStack {
                Circle()
                    .rotation(rotation)
                    .trim(from: 0, to: CGFloat(trimAmount))
                    .stroke(strokeColor, style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
                
                Circle()
                    .rotation(rotation)
                    .trim(from: 0, to: CGFloat(trimAmount) * CGFloat(fractionCompleted))
                    .stroke(strokeColorF.opacity(0.9), style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
                
                Text(percentage)
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .offset(y: -20)
                    .foregroundColor(strokeColorF)
                    .animation(nil, value: 0)
            }
            image
                .frame(width: 20)
                .foregroundColor(strokeColorF)
                .font(.system(size: 50))
                .offset(y: -78)
            
            
        }
    }
}

// MARK: Challenge 3

struct GaugeProgressStyleCh3: ProgressViewStyle {
    
    var trimAmount = 0.75
    var strokeColor = Color.pps8
    var strokeColorF = Color.pps4
    var strokeWidth = 25.0
    var image = Image(systemName: "bicycle")
    let formatter = NumberFormatter()
    
    var rotation: Angle {
        Angle(radians: .pi * (1 - trimAmount)) + Angle(radians:  .pi / 2)
    }
    
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        formatter.numberStyle = .percent
        let percentage = formatter.string(from: fractionCompleted as NSNumber) ?? "0%"
        
        
        return VStack {
            ZStack {
                Circle()
                    .rotation(rotation)
                    .trim(from: 0, to: CGFloat(trimAmount))
                    .stroke(strokeColor,style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
                    
                    .mask(
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient:
                                        Gradient(
                                            colors: [strokeColor, strokeColorF.opacity(0.5)]),
                                    startPoint: .bottomLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    )
                
                Circle()
                    .rotation(rotation)
                    .trim(from: 0, to: CGFloat(trimAmount) * CGFloat(fractionCompleted))
                    .stroke(strokeColorF.opacity(0.9), style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
                
                Text(percentage)
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .offset(y: -20)
                    .foregroundColor(strokeColorF)
                    .animation(nil, value: 0)
            }
            image
                .frame(width: 20)
                .foregroundColor(strokeColorF)
                .font(.system(size: 50))
                .offset(y: -78)
            
            
        }
    }
}
