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
    func isFavorite() {
        model.favorite?.toggle()
    }
}
