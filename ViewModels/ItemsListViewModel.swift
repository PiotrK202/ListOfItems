//
//  ItemsListViewModel.swift
//  ListOfItems
//
//  Created by piotr koscielny on 04/03/2025.
//

import SwiftUI

@MainActor
final class ItemsListViewModel: ObservableObject {
    @Published private(set) var models: [ItemModel] = []
    @Published var state: ViewsToDisplay = .downloading
    private let itemDataServicingMock: ItemDataServiceMock
    
    init(itemDataServicingMock: ItemDataServiceMock) {
        self.itemDataServicingMock = itemDataServicingMock

    }
    
    func fetchItems() async throws {
        do {
            let item = try await itemDataServicingMock.downloadItemAsync()
            self.state = item.isEmpty ? .error("empty") : .mainView
        } catch {
            self.state = .error(error.localizedDescription)
        }
    }
    
    func showFavorite() {
        
    }
    
    func fitreadItems() {
        
    }
}
