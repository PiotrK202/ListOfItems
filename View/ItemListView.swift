//
//  ItemListView.swift
//  ListOfItems
//
//  Created by piotr koscielny on 04/03/2025.
//
import SwiftUI

@MainActor
struct ItemListView: View {
    @StateObject var viewModel: ItemsListViewModel
    
    var body: some View {
        NavigationView {
            ForEach(viewModel.models, id: \.id) { item in
                NavigationLink(destination: ItemDetailsView()) {
                    CellView(viewModel:ItemViewModel(model: item))
                }
            }
        }
    }
}
struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
//        let model = ItemModel(id: 4, title: "321", price: 321, description: "asd", category: nil, images: nil)
        let model = ItemDataService()
        let viewModel = ItemsListViewModel(itemDataServicing: model)
        ItemListView(viewModel: viewModel)
    }
}
