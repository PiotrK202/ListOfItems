//
//  ItemViewModel.swift
//  ListOfItems
//
//  Created by piotr koscielny on 04/03/2025.
//

import Foundation

final class ItemViewModel: ObservableObject {
    @Published private(set) var model: ItemModel
    
    init(model: ItemModel) {
        self.model = model
    }
    var image: String {
        (model.favorite ?? false ? "heart.fill" : "heart")
    }
    
    var title: String {
        model.title ?? ""
    }
    
    var price: String? {
        model.price?.formatPrice() ?? "0"
    }
}
