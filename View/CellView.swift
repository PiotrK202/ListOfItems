//
//  CellView.swift
//  ListOfItems
//
//  Created by piotr koscielny on 04/03/2025.
//

import SwiftUI

struct CellView: View {
    @StateObject var viewModel: ItemViewModel
    
    var body: some View {
        VStack {
            
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        let model = ItemModel(id: 4, title: "eq", price: 123, description: "eqewq", category: nil, images: nil)
        let viewModel = ItemViewModel(model: model)
        CellView(viewModel: viewModel)
    }
}

