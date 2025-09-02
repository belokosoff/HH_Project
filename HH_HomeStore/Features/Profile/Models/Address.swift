//
//  Address.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 18.08.2025.
//

struct Address: Codable, Hashable {
    let city : String
    let street : String
    let postcode : String
    let country : String
}
