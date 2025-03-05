//
//  ItemDataService.swift
//  ListOfItems
//
//  Created by piotr koscielny on 04/03/2025.
//
import Foundation
import CoreVideo

protocol ItemDataServicing {
    func downloadItemAsync() async throws -> [ItemModel]
}

final class ItemDataService: ItemDataServicing {
    func downloadItemAsync() async throws -> [ItemModel] {
        let url = "https://api.escuelajs.co/api/v1/products"
        guard let url = URL(string: url) else {  throw URLError(.badURL) }
        
        let (data,_) = try await URLSession.shared.data(from: url, delegate: nil)
        let item = try JSONDecoder().decode([ItemModel].self, from: data)
        return item
    }
}

final class ItemDataServiceMock: ItemDataServicing {
    func downloadItemAsync() async throws -> [ItemModel] {
        let category = Category(id: 1, name: "Category", image: nil)
        return [
            ItemModel(id: 1, title: "title", price: 13, description: "description", category: category, images: [""]),
            ItemModel(id: 2, title: "title 2", price: 1231, description: "description 2", category: category, images: [""]),
            ItemModel(id: 3, title: "title 3", price: 14, description: "descriptioneqw", category: category, images: [""]),
            ItemModel(id: 4, title: "title 4", price: 123, description: "description eqw", category: category, images: [""]),
            ItemModel(id: 5, title: "title 5", price: 153, description: "description eqw", category: category, images: [""]),
            ItemModel(id: 6, title: "title 6", price: 112, description: "descriptioneqweq", category: category, images: [""]),
            ItemModel(id: 7, title: "title 7", price: 12, description: "descriptioneqw", category: category, images: [""]),
            ItemModel(id: 8, title: "title 8", price: 112, description: "descriptionqwer", category: category, images: [""]),
            ItemModel(id: 9, title: "title 9", price: 144, description: "descriptionrqwrq", category: category, images: [""]),
            ItemModel(id: 10, title: "title 10", price: 421, description: "descriptionrqwrqr", category: category, images: [""]),
            ItemModel(id: 11, title: "title 11", price: 121, description: "descriptionrqwrqw", category: category, images: [""]),
            ItemModel(id: 12, title: "title 12", price: 124, description: "descriptionrqwrq", category: category, images: [""]),
            ItemModel(id: 13, title: "title 13", price: 121, description: "descriptionrqrq", category: category, images: [""]),
            ItemModel(id: 14, title: "title 14", price: 121, description: "descriptionrqwrq", category: category, images: [""]),
            ItemModel(id: 15, title: "title 15", price: 231, description: "descriptionrqwqwr", category: category, images: [""])
        ]
    }
}
