//
//  TimerService.swift
//  BreathingAnimationWatchOS Watch App
//
//  Created by iOS Developer on 13/11/25.
//

import Foundation
import Combine

final class TimerService: TimerServiceProtocol{
    private var timer: AnyCancellable?
    
    func startBreathingCycle(duration: Double, phaseToggled: @escaping () -> Void) {
        stop()
        
        timer = Timer.publish(every: duration, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                phaseToggled()
            }
    }
    
    func stop() {
        timer?.cancel()
        timer = nil
    }
    
    
}
