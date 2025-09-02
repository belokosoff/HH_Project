//
//  Shipping.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 01.09.2025.
//
import Foundation

struct Shipping_Product: Codable, Hashable {
    let address: Address
    let eta: Date?
}
