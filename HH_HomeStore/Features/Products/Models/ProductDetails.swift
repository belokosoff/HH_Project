//
//  ProductDetails.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 02.09.2025.
//

import Foundation

struct ProductDetails: Codable {
    let id: String
    let title: String
    let price: Double
    let currency: String
    let gallery: [URL]
    let options: Options
    let variants: [Variant]
    let selected: SelectedOptions
    let description: String?
    let specs: [Spec]
    let shipping: Shipping_Product
    let reviewsSummary: ReviewsSummary
    let topReview: Review?
}
