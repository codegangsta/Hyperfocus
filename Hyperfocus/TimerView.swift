//
//  TimerView.swift
//  Hyperfocus
//
//  Created by Jeremy Saenz on 8/27/23.
//

import SwiftUI

struct TimerView: View {
    let workDuration = 25 * 60
    let breakDuration = 5 * 60
        
    @State private var timeRemaining: Int = 25 * 60
    @State private var timer: Timer? = nil
    @State private var isWorkTime = true
    @State private var editTime = false
    
    var body: some View {
        HStack(spacing: 2) {
            HStack(spacing: 16) {
                if(true) {
                    Image(systemName: "square")
                        .imageScale(.large)
                        .symbolRenderingMode(.monochrome)
                        .foregroundColor(.secondary)
                }
                VStack(alignment: .leading) {
                    Text("☕️ Daily Review")
                    HStack(spacing: 4) {
                        Image(systemName: "circle.fill")
                            .imageScale(.small)
                            .foregroundColor(.blue)
                        Text("Work")
                            .foregroundColor(.secondary)
                    }
                    .font(.body)
                }
                .font(.system(.title3, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .clipped()
            }
            HStack(spacing: 24) {
                Button(action: {
                    editTime.toggle()
                }, label: {
                    Text("\(timeRemaining / 60):\(String(format: "%02d", timeRemaining % 60))")
                        .font(.system(.largeTitle, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .frame(alignment: .center)
                        .clipped()
                })
                .buttonStyle(.plain)
                .popover(isPresented: $editTime) {
                    EditTime(seconds: $timeRemaining)
                }
                
                Button(action: toggle, label: {
                    Image(systemName: timer == nil ? "play.fill" : "stop.fill")
                        .imageScale(.large)
                        .symbolRenderingMode(.monochrome)
                        .font(.title2)
                })
                .buttonStyle(.plain)
                .keyboardShortcut(.return, modifiers: .command)
            }
        }
        .padding([.horizontal], 24)
        .frame(minWidth: 480, maxHeight: .infinity, alignment: .center)
        .clipped()
        .background {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(.blue, lineWidth: timer == nil ? 0 : 2)
                .background(RoundedRectangle(cornerRadius: 8, style: .continuous).fill(Color(.underPageBackgroundColor)))
        }
    }
    
    private func toggle() {
        if(timer == nil) {
            start()
        } else {
            stop()
        }
    }
    
    private func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if(timeRemaining > 0) {
                timeRemaining -= 1
            } else {
                isWorkTime.toggle()
                timeRemaining = isWorkTime ? workDuration : breakDuration
            }
            
        }
    }
    
    private func stop() {
        timeRemaining = workDuration
        timer?.invalidate()
        timer = nil
    }
    
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView().frame(width: 480, height: 100)
    }
}
