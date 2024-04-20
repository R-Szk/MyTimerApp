//
//  ContentView.swift
//  MyTimerApp
//
//  Created by 鈴木龍斗 on 2024/04/20.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            // 下の円
            Circle()
                .stroke(
                    Color.gray,
                    style: StrokeStyle(lineWidth: 15, lineCap: .round))
                .opacity(0.5) // 透明度
                .frame(width: 300, height: 300)
            // 上の円
            Circle()
                .trim(from: 0.0, to: 0.5)
                .stroke(
                    Color.orange,
                    style: StrokeStyle(lineWidth: 15, lineCap: .round))
                .frame(width: 300, height: 300)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
