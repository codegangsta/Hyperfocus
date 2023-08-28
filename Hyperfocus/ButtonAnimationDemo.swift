//
//  ButtonAnimationDemo.swift
//  Hyperfocus
//
//  Created by Jeremy Saenz on 8/27/23.
//

import SwiftUI

struct ButtonAnimationDemo: View {
    var action: () -> Void
    @State private var scale = 1.0
    
    var body: some View {
        Button(action: {
            if(scale == 1) {
                scale = 50
            } else {
                scale = 1
            }
        }) {
            ZStack {
                Circle()
                    .background {
                        LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom)
                    }
                    .cornerRadius(.infinity)
                    .frame(width: 60, height: 60)
                    .scaleEffect(scale)
                    .animation(scale > 1 ? .easeIn : .easeOut, value: scale)
                    .zIndex(0)
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
            }
        }.tint(.red.opacity(0))
    }
}

struct ButtonAnimationDemo_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Hello").zIndex(100)
            ButtonAnimationDemo {
                print("Hello")
            }
            Text("World")
        }
        .padding()
    }
}
