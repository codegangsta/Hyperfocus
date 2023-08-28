//
//  HyperfocusApp.swift
//  Hyperfocus
//
//  Created by Jeremy Saenz on 8/19/23.
//

import SwiftUI

final class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        if let window = NSApplication.shared.windows.first {
            window.level = .floating
            window.styleMask = [.titled, .fullSizeContentView]
            window.titlebarAppearsTransparent = true
            window.titleVisibility = .hidden
            window.isMovableByWindowBackground = true
            
            let currentFrame = window.frame
            window.setFrame(CGRect(
                x: currentFrame.origin.x,
                y: currentFrame.origin.y,
                width: 480,
                height: 80
            ), display: true)
        }
    }
}

@main
struct HyperfocusApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        Window("Timer", id: "hyperfocus-timer") {
            TimerView().edgesIgnoringSafeArea(.top)
        }.windowStyle(.hiddenTitleBar)
    }
}
