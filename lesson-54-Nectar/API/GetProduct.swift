//
//  GetProduct.swift
//  lesson-54-Nectar
//
//  Created by JAHONGIR on 23/10/23.
//

import Foundation

struct ProductModel: Codable {
    let id: Int?
    let title: String?
    let price: Int
    let description: String?
    let images: [String]?
    let creationAt, updatedAt: String?
    let category: CategoryModel?
    
    
}

struct CategoryModel: Codable {
    let id: Int?
    let name: String?
    let image: String?
    let creationAt, updatedAt: String?
}
