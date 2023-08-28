//
//  RootView.swift
//  Hyperfocus
//
//  Created by Jeremy Saenz on 8/20/23.
//

import SwiftUI


struct RootView: View {
    
    @State private var settings = false
    
    var body: some View {
        TabView {
            ContentView().tabItem {
                Label("Timer", systemImage: "list.dash")
            }
            SettingsView().tabItem {
                Label("Settings", systemImage: "list.dash")
            }
            ButtonAnimationDemo(action: {
                print("Boom")
            }).tabItem {
                Label("Button", systemImage: "list.dash")
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
