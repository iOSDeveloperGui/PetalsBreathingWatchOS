//
//  BreathingView .swift
//  BreathingAnimationWatchOS Watch App
//
//  Created by iOS Developer on 13/11/25.
//

import Foundation
import SwiftUI

struct BreathingView: View{
    @EnvironmentObject private var viewModel: BreathingViewModel
    
    var body: some View{
        ZStack{
            Color.black.ignoresSafeArea(.all)
            
            ZStack{
                ForEach(0..<8, id: \.self){ index in
                    Circle()
                        .fill(viewModel.isAnimating ? Color.green.opacity(0.4) : Color.blue)
                        .opacity(0.6)
                        .shadow(color: Color.green, radius: 2)
                        .frame(width: 100, height: 100)
                        .offset(x: viewModel.isAnimating ? 56 : 28)
                        .rotationEffect(.degrees(Double(index) * ( 360 / Double(8))))
                    
                }
                
            }
            .padding()
            .rotationEffect(.degrees(viewModel.rotationAngle))
            .scaleEffect(viewModel.scaleFactor)
            .onAppear {
                withAnimation(
                    .easeInOut(duration: 4.0)
                    .repeatForever(autoreverses: true)
                ) {
                    viewModel.isAnimating = true
                }
            }
        }
    }
}

#Preview {
    BreathingView()
        .environmentObject(BreathingViewModel(model: BreathingModel(), timerService: TimerService()))
}
