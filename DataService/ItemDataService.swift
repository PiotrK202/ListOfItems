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
            ItemModel(id: 1, title: "title", price: 1, description: "description", category: category, images: nil),
            ItemModel(id: 2, title: "title 2", price: 1, description: "description 2", category: category, images: nil)
        ]
    }
}
