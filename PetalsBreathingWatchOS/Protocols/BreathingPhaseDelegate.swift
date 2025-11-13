//
//  BreathingPhaseDelegate.swift
//  BreathingAnimationWatchOS Watch App
//
//  Created by iOS Developer on 13/11/25.
//

import Foundation

protocol BreathingPhaseDelegate: AnyObject{
    func breathingPhaseDidToggle(isExhaling: Bool)
    func start() 
}
