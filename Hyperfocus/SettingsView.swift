//
//  SettingsView.swift
//  Hyperfocus
//
//  Created by Jeremy Saenz on 8/20/23.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var store = ContextStore()
    @State private var showingAddContext = false
    @State private var newContextName = ""
    @State private var newContextColor = Color.red

    var body: some View {
        NavigationStack {
            List {
                ForEach(store.contexts) { context in
                    HStack {
                        Circle()
                            .fill(context.color)
                            .frame(width: 20, height: 20)
                        Text(context.name)
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("Pomodoro Settings")
            .toolbar {
                Button("Add") {
                    showingAddContext = true
                }
            }
//            .navigationBarItems(trailing: Button(action: {
//                showingAddContext = true
//            }) {
//                Image(systemName: "plus")
//            })
            .sheet(isPresented: $showingAddContext) {
                VStack {
                    TextField("Context Name", text: $newContextName)
                        .padding()
                    ColorPicker("Select a color", selection: $newContextColor)
                        .padding()
                    Button("Add Context") {
                        let context = Context(name: newContextName, color: newContextColor)
                        store.contexts.append(context)
                        showingAddContext = false
                    }
                    .padding()
                }
            }
        }
    }

    func delete(at offsets: IndexSet) {
        store.contexts.remove(atOffsets: offsets)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
