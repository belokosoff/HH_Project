//
//  Main.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 17.08.2025.
//

// MainView.swift
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    SearchField(text: .constant(""))
                    
                    CategorySlide()
                    
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 16),
                    ], spacing: 16) {
                        ForEach(0..<20) { index in
                            NavigationLink(destination: ProductDetailView()) {
                                ProductCard()
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    HomeView()
}
