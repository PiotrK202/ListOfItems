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
    private var allModels: [ItemModel] = []
    private var filteringFavorites = false
    
    init(itemDataServicingMock: ItemDataServiceMock) {
        self.itemDataServicingMock = itemDataServicingMock
        
    }
    
    func fetchItems() async throws {
        do {
            let items = try await itemDataServicingMock.downloadItemAsync()
            self.allModels = items
            self.models = items
            self.state = items.isEmpty ? .error("empty") : .mainView
        } catch {
            self.state = .error(error.localizedDescription)
        }
    }
    
    func showFavorite(isFavorite: Bool) {
        filteringFavorites = isFavorite
        if isFavorite {
            models = allModels.filter({$0.favorite ?? false })
        } else {
            models = allModels
        }
    }
    
    func fitreadItems(searchText: String) {
        let itemsList = filteringFavorites ? allModels.filter({$0.favorite ?? false }) : allModels
        if searchText.isEmpty {
            models = itemsList
        } else {
            models = itemsList.filter({$0.title?.localizedStandardContains(searchText) ?? false })
        }
    }
}
