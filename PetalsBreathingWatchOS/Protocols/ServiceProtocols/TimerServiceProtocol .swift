//
//  TimerServiceProtocol .swift
//  BreathingAnimationWatchOS Watch App
//
//  Created by iOS Developer on 13/11/25.
//

import Foundation

protocol TimerServiceProtocol: AnyObject{
    func startBreathingCycle(duration: Double, phaseToggled: @escaping () -> Void)
    func stop()
}
