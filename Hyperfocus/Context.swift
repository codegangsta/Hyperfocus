//
//  Context.swift
//  Hyperfocus
//
//  Created by Jeremy Saenz on 8/27/23.
//

import Foundation
import SwiftUI

struct Context: Identifiable, Codable {
    var id = UUID()
    var name: String
    var color: Color
    // Add more properties as needed
}
