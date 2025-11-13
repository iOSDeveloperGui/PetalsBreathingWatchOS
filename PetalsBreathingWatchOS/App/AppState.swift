//
//  BreathingCoordinator .swift
//  BreathingAnimationWatchOS Watch App
//
//  Created by iOS Developer on 13/11/25.
//

import Foundation


final class AppState: ObservableObject, BreathingPhaseDelegate{
    @Published var currentScreen: Screen = .homeView
    
    let viewModel: BreathingViewModel
    
    init(){
        let breathingModel = BreathingModel()
        let timerService: TimerServiceProtocol = TimerService()
        
        self.viewModel = BreathingViewModel(model: breathingModel, timerService: timerService)
        
        self.viewModel.delegate = self
        
        self.viewModel.startBreathingCycle()
        self.breathingPhaseDidToggle(isExhaling: false)
        self.start()
    }
    
    func start(){
        currentScreen = .homeView
    }
    
    func breathingPhaseDidToggle(isExhaling: Bool) {
        let phase = isExhaling ? "Exhale" : "Inhale"
        print("Coordinator received delegation: Breathing phase changed to \(phase)")
    }
    
    
}
