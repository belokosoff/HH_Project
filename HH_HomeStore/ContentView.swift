//  ContentView.swift
//  HH_HomeStore
//  Created by Maxim Belokosov on 17.08.2025.

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0

    var body: some View {
        CustomTabView(selection: $selectedTab)
    }
}

#Preview {
    ContentView()
}
