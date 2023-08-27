//
//  ContextStore.swift
//  Hyperfocus
//
//  Created by Jeremy Saenz on 8/27/23.
//

import Foundation

class ContextStore: ObservableObject {
    @Published var contexts: [Context] {
        didSet {
            if let encoded = try? JSONEncoder().encode(contexts) {
                UserDefaults.standard.set(encoded, forKey: "contexts")
            }
        }
    }

    init() {
        if let contextsData = UserDefaults.standard.data(forKey: "contexts"),
           let decodedContexts = try? JSONDecoder().decode([Context].self, from: contextsData) {
            self.contexts = decodedContexts
        } else {
            self.contexts = []
        }
    }
}
