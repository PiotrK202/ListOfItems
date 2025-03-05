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
    @State var textField = ""
    @State var showFavorite = false
    
    var body: some View {
        NavigationView {
            List {
                TextField("search", text: $textField)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .keyboardType(.default)
                    .submitLabel(.done)
                    .onSubmit {
                        viewModel.fitreadItems(searchText: textField)
                    }
                ForEach(viewModel.models) { item in
                    NavigationLink(destination: ItemDetailsView()) {
                        CellView(viewModel:ItemViewModel(model: item))
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("items")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        showFavorite.toggle()
                        viewModel.showFavorite(isFavorite:showFavorite)
                    } label: {
                        Text("favorite")
                    }
                    Button {
                        
                    } label: {
                        Text("add")
                    }
                }
            }
            .onAppear {
                Task {
                    do {
                    try await viewModel.fetchItems()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}
struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        //        let model = ItemModel(id: 4, title: "321", price: 321, description: "asd", category: nil, images: nil)
//
//        let model = ItemDataServiceMock()
//        let viewModel = ItemsListViewModel(itemDataServicingMock: model)
//        ItemListView(viewModel: viewModel)
        ItemListView(viewModel: ItemsListViewModel(itemDataServicingMock: ItemDataServiceMock()))
    }
}
