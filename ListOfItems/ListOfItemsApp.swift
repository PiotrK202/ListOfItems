//
//  ListOfItemsApp.swift
//  ListOfItems
//
//  Created by piotr koscielny on 04/03/2025.
//

import SwiftUI

@main
struct ListOfItemsApp: App {
    var body: some Scene {
        WindowGroup {
            ItemListView(viewModel: ItemsListViewModel(itemDataServicingMock: ItemDataServiceMock()))
        }
    }
}
