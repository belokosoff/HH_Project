// Created by Maxim Belokosov.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var composition: AppComposition

    var body: some View {
        CustomTabView(productsVM: ProductsViewModel(), cartVM: CartViewModel(ordersVM: OrdersViewModel()), profileVM: ProfileViewModel())
    }
}

#Preview {
    let composition = AppComposition()
    return ContentView()
        .environmentObject(composition)
}
