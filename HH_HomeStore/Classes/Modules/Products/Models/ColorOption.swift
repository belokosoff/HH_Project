// Created by Maxim Belokosov.
//

import SwiftUI

struct ColorOption: Codable, Identifiable {
    let id: String
    let name: String
    let hex: String

    var uiColor: Color { Color(hex: hex) }
}
