// Created by Maxim Belokosov.
//

//
//  Review.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 19.08.2025.
//
import Foundation

struct Review: Identifiable, Codable {
    let id: String
    let author: Author
    let rating: Int
    let createdAt: Date
    let text: String
    let likes: Int
    let dislikes: Int
}
