//
//  File.swift
//  
//
//  Created by Danilo Joksimovic on 2023-11-21.
//

import Foundation

import SwiftUI

@available(iOS 13.0, *)
struct CircleLoadingBar: View {
    @State private var isLoading = false
    @State var style: LoadingButtonStyle
    
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(style.strokeColor, style: StrokeStyle(lineWidth: style.strokeWidth, lineCap: .round, lineJoin: .round))
            .frame(width: style.height - 20, height: style.height - 20)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(Animation.default.repeatForever(autoreverses: false), value: isLoading)
            .onAppear() {
                self.isLoading = true
            }
    }
}
