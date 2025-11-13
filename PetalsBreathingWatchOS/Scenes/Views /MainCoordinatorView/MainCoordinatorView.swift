//
//  ContentView.swift
//  BreathingAnimationWatchOS Watch App
//
//  Created by iOS Developer on 13/11/25.
//

import SwiftUI

struct MainCoordinator: View {
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        Group{
            switch appState.currentScreen {
                
            case .homeView:
                BreathingView()
            }
        }
    }
}

#Preview {
    MainCoordinator()
}
