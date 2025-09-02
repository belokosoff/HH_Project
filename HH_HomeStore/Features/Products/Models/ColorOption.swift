//
//  ColorOption.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 02.09.2025.
//

import SwiftUI

struct ColorOption: Codable, Identifiable {
    let id: String
    let name: String
    let hex: String
    var uiColor: Color { Color(hex: hex) } // расширение ниже
}
