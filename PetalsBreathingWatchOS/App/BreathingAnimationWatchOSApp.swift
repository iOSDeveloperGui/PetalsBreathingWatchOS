//
//  BreathingAnimationWatchOSApp.swift
//  BreathingAnimationWatchOS Watch App
//
//  Created by iOS Developer on 13/11/25.
//

import SwiftUI

@main
struct PetalsBreathingWatchOS: App {
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            MainCoordinator()
                .environmentObject(appState)
        }
    }
}
