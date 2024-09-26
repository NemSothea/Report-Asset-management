//
//  HUBView.swift
//  Report Asset management
//
//  Created by sothea007 on 25/9/24.
//

import SwiftUI
import Combine

enum LoadingType {
    case linesScalling
    case dotScalling
}

struct HUBView: View {
    
    // MARK: - Propertiest
    let dotSize         : CGFloat
    let timing          : CGFloat
    let animationTimer  : Publishers.Autoconnect<Timer.TimerPublisher>
    let animationColor  : Publishers.Autoconnect<Timer.TimerPublisher>
    
    let loadingType : LoadingType
    
    private let maxCounter = 3
    
    @State private var counter      = -1
    @State private var colorIndex   = 0
    
    @State private var color0 : [Color] = [.cyan,.green,.red]
    @State private var color1 : [Color] = [.green,.cyan,.red]
    @State private var color2 : [Color] = [.red,.cyan,.green]
    
    init(dotSize: CGFloat = 15.0, timing: CGFloat,speed : CGFloat = 0.5,loadingType: LoadingType) {
        self.dotSize = dotSize
        self.timing = speed/2
        self.animationTimer = Timer.publish(every: timing, on: .main, in: .common).autoconnect()
        self.animationColor = Timer.publish(every: timing * 3, on: .main, in: .common).autoconnect()
        self.loadingType = loadingType
    }
    
    // MARK: - Content
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black.opacity(0.1))
                .ignoresSafeArea()
          
            switch loadingType {
            case .linesScalling:
                //Lines scalling
                linesViewScaling()
            case .dotScalling:
                //Dot scalling
                dotViewScaling()
            }

        }
    }
     
}

// MARK: - dot scalling
extension HUBView {
    
    @ViewBuilder
    private func dotViewScaling() -> some View {
        RoundedRectangle(cornerRadius: 15.0)
            .fill(.exchange)
            .frame(width: 100,height: 100)
            .overlay {
                HStack {
                    ForEach(0..<maxCounter,id: \.self) { index in
                        
                        let jump = dotSize / CGFloat(4)
                        
                        let offsetY = counter == index ? -jump : jump
                        
                        let colors : [Color] = index == 0 ? color0 : (index == 1 ? color1 : color2)
                            Circle()
                          
                            .frame(width: dotSize,height: dotSize)
                            .foregroundStyle(colors[colorIndex])
                            .offset(y:offsetY)
                    }
                }
            }
            .onReceive(animationTimer, perform: { _ in
                withAnimation(.easeInOut(duration: timing)){
                    counter = counter == maxCounter-1 ? 0 : counter + 1
                }
            })
            .onReceive(animationColor, perform: { _ in
                withAnimation(.easeIn){
                    colorIndex = colorIndex == color0.count-1 ? 0 : colorIndex + 1
                }
            })
    }
    
}

    // MARK: - lines scalling
extension HUBView {
    @ViewBuilder
    private func linesViewScaling() -> some View {
        RoundedRectangle(cornerRadius: 15.0)
            .fill(.exchange)
            .frame(width: 100,height: 100)
            .overlay {
                HStack {
                    ForEach(0..<maxCounter,id: \.self) { index in
                        let maxHeight = counter == index ? dotSize : dotSize * 3
                        let colors : [Color] = index == 0 ? color0 : (index == 1 ? color1 : color2)
                        
                            RoundedRectangle(cornerRadius: dotSize/2)
                            .frame(maxWidth: dotSize,maxHeight: maxHeight)
                            .foregroundColor(colors[colorIndex])
                    }
                }
            }
            .onReceive(animationTimer, perform: { _ in
                withAnimation(.easeInOut(duration: timing)){
                    counter = counter == maxCounter-1 ? 0 : counter + 1
                }
            })
            .onReceive(animationColor, perform: { _ in
                withAnimation(.easeIn){
                    colorIndex = colorIndex == color0.count-1 ? 0 : colorIndex + 1
                }
            })
    }
}
#Preview {
    HUBView(dotSize:13.0, timing: 0.2, loadingType: .linesScalling)
}
