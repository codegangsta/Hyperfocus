//
//  ContentView.swift
//  Hyperfocus
//
//  Created by Jeremy Saenz on 8/19/23.
//

import SwiftUI
import CoreData
import ManagedSettings
import FamilyControls

struct ContentView: View {
    let wordDuration = 25 * 60
    let breakDuration = 5 * 60
    
    let store = ManagedSettingsStore()
        
    @State private var timeRemaining: Int = 25 * 60
    @State private var timer: Timer? = nil
    @State private var isWorkTime = true
    @State private var isBlocked = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text(isWorkTime ? "Focus" : "Break")
                .font(.largeTitle)
            Text("\(timeRemaining / 60):\(String(format: "%02d", timeRemaining % 60))")
                .font(.largeTitle)
            
            HStack {
                Button("Start") {
                    startTimer()
                }
                Button("Stop") {
                    stopTimer()
                }
            }
            Button(isBlocked ? "Unblock" : "Block") {
                toggleBlock()
            }
        }
        .padding(.all)
        .onAppear {
            Task {
                try await AuthorizationCenter.shared.requestAuthorization(for: FamilyControlsMember.individual)
            }
        }
    }
    
    private func toggleBlock() {
        isBlocked.toggle()
        
        if isBlocked {
            store.shield.applicationCategories = .all()
            
        } else {
            store.shield.applicationCategories = .none
        }
        
    }
    
    private func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if(timeRemaining > 0) {
                timeRemaining -= 1
            } else {
                isWorkTime.toggle()
                timeRemaining = isWorkTime ? wordDuration : breakDuration
            }
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
