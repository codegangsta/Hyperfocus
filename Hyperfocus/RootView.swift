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
        NavigationStack {
            ContentView().toolbar {
                NavigationLink("hey", "settings")
                Button("Settings") {
                    settings = true
                }
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
