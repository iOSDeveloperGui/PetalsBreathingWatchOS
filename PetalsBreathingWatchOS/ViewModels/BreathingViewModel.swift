//
//  BreathingViewModel.swift
//  BreathingAnimationWatchOS Watch App
//
//  Created by iOS Developer on 13/11/25.
//

import Foundation
import Combine

final class BreathingViewModel: ObservableObject{
    @Published var isAnimating: Bool = false
    
    weak var delegate: BreathingPhaseDelegate?
    
    private let model: BreathingModel
    private let timerService: TimerServiceProtocol
    
    var scaleFactor: CGFloat { isAnimating ? 0.95 : 0.25 }
    var rotationAngle: Double { isAnimating ? 0.55 : 0.25 }
      
    init(model: BreathingModel, timerService: TimerServiceProtocol){
        self.model = model
        self.timerService = timerService
    }
    
    func startBreathingCycle(){
        settingUpAnimation()
        
        let phaseToggleCallback: () -> Void = { [ weak self ] in
            guard let self = self else { return }
            
            self.isAnimating.toggle()
            
            self.delegate?.breathingPhaseDidToggle(isExhaling: !self.isAnimating)
        }
        timerService.startBreathingCycle(duration: model.animationDuration, phaseToggled: phaseToggleCallback)
    }
    
    func settingUpAnimation(){
        isAnimating = true
    }
    
    deinit{
        timerService.stop()
    }
    
    
}
