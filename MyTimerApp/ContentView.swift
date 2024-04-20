//
//  ContentView.swift
//  MyTimerApp
//
//  Created by 鈴木龍斗 on 2024/04/20.
//

import Foundation
import SwiftUI
import Combine

struct ContentView: View {
    // ViewModelをStateObjectで宣言してCircleProgressViewModelを監視でkるようにする
    @StateObject var viewModel = CircleProgressViewModel()
    
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
                .trim(from: 0.0, to: viewModel.progressValue)
                .stroke(
                    Color.orange,
                    style: StrokeStyle(lineWidth: 15, lineCap: .round))
                .frame(width: 300, height: 300)
                .rotationEffect(Angle(degrees: -90))
        }
        .padding()
    }
}

final class CircleProgressViewModel: ObservableObject {
    @Published var progressValue: CGFloat = 0.0
    private var timerCount: CGFloat = 0.0
    private var cancellabel: AnyCancellable?
    
    init() {
        startTimer()
    }
    
    private func startTimer() {
        timerCount = 60
        
        cancellabel = Timer.publish(every: 0.1, on: .main, in: .default)
            .autoconnect()
            .sink { [weak self] _ in
                self?.countProgress()
            }
    }
    
    private func countProgress() {
        if timerCount < 0 {
            cancellabel?.cancel()
        }
        timerCount = timerCount - 0.1
        progressValue = timerCount / 60
    }
}

#Preview {
    ContentView()
}
