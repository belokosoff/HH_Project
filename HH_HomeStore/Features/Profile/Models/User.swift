//
//  User.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 27.08.2025.
//
import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let avatarUrl: URL?
}
