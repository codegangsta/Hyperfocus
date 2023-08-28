//
//  EditTime.swift
//  Hyperfocus
//
//  Created by Jeremy Saenz on 8/27/23.
//

import SwiftUI

struct EditTime: View {
    @Binding var seconds: Int
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Edit time").font(.headline)
            HStack {
                Button("-5") {
                    seconds -= 5 * 60
                }
                Button("-1") {
                    seconds -= 1 * 60
                }
                Button("+1") {
                    seconds += 1 * 60
                }
                Button("+5") {
                    seconds += 5 * 60
                }
            }
        }.padding(12)
    }
}

struct EditTime_Previews: PreviewProvider {
    @State static private var time = 25 * 60
    static var previews: some View {
        EditTime(seconds: $time)
    }
}
