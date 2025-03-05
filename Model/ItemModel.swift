//
//  ItemModel.swift
//  ListOfItems
//
//  Created by piotr koscielny on 04/03/2025.
//

import Foundation
import SwiftUI

final class ItemModel: Codable, Identifiable {
    let id: Int
    let title: String?
    let price: Int?
    let description: String?
    let category: Category?
    let images: [String]?
    var favorite: Bool? = false
    
    init(id: Int, title: String?, price: Int?, description: String?, category: Category?, images: [String]?) {
        self.id = id
        self.title = title
        self.price = price
        self.description = description
        self.category = category
        self.images = images
    }
    
    private enum CodingKeys: String, CodingKey {
        case id, title, price, description, category, images
    }
}

struct Category: Codable {
    let id: Int?
    let name: String?
    let image: String?
}

