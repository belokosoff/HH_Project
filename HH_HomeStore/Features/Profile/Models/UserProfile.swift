//
//  UserProfile.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 27.08.2025.
//
import Foundation

struct UserProfile: Codable {
    let id: String
    let name: String
    let email: String
    let avatarUrl: URL?
    let phone: String
    let address: Address
    let birthDate: Date
    let createdAt: Date
}
