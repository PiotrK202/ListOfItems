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
            if let imageUrl = viewModel.image {
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
            }
        VStack(spacing: 10) {
            Text(viewModel.title)
                .font(.headline)
            HStack {
                Image(systemName: "heart")
            }
            
            Spacer()
            
            Text(viewModel.price ?? "")
                .font(.subheadline)
            }
        }
    }
}
struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        let model = ItemModel(id: 4, title: "eq", price: 123, description: "eqewq", category: nil, images: [""])
        let viewModel = ItemViewModel(model: model)
        CellView(viewModel: viewModel)
    }
}

