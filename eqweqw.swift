////
////  eqweqw.swift
////  ListOfItems
////
////  Created by piotr koscielny on 05/03/2025.
////
//
//import Foundation
//import SwiftUI
//
//final class ItemModel: Codable, Identifiable {
//    let id: Int
//    let title: String?
//    let price: Int?
//    let description: String?
//    let category: Category?
//    let images: [String]?
//    var favorite: Bool? = false
//
//    init(id: Int, title: String?, price: Int?, description: String?, category: Category?, images: [String]?) {
//        self.id = id
//        self.title = title
//        self.price = price
//        self.description = description
//        self.category = category
//        self.images = images
//    }
//
//    private enum CodingKeys: String, CodingKey {
//        case id, title, price, description, category, images
//    }
//}
//
//struct Category: Codable {
//    let id: Int?
//    let name: String?
//    let image: String?
//}
//// diffrent file
//protocol ItemDataServicing {
//    func downloadItemAsync() async throws -> [ItemModel]
//}
//
//final class ItemDataService: ItemDataServicing {
//    func downloadItemAsync() async throws -> [ItemModel] {
//        let url = "https://api.escuelajs.co/api/v1/products"
//        guard let url = URL(string: url) else {  throw URLError(.badURL) }
//
//        let (data,_) = try await URLSession.shared.data(from: url, delegate: nil)
//        let item = try JSONDecoder().decode([ItemModel].self, from: data)
//        return item
//    }
//}
//
//final class ItemDataServiceMock: ItemDataServicing {
//    func downloadItemAsync() async throws -> [ItemModel] {
//        let category = Category(id: 1, name: "Category", image: nil)
//        return [
//            ItemModel(id: 1, title: "title", price: 13, description: "description", category: category, images: [""]),
//            ItemModel(id: 2, title: "title 2", price: 1231, description: "description 2", category: category, images: [""]),
//            ItemModel(id: 3, title: "title 3", price: 14, description: "descriptioneqw", category: category, images: [""]),
//            ItemModel(id: 4, title: "title 4", price: 123, description: "description eqw", category: category, images: [""]),
//            ItemModel(id: 5, title: "title 5", price: 153, description: "description eqw", category: category, images: [""]),
//            ItemModel(id: 6, title: "title 6", price: 112, description: "descriptioneqweq", category: category, images: [""]),
//            ItemModel(id: 7, title: "title 7", price: 12, description: "descriptioneqw", category: category, images: [""]),
//            ItemModel(id: 8, title: "title 8", price: 112, description: "descriptionqwer", category: category, images: [""]),
//            ItemModel(id: 9, title: "title 9", price: 144, description: "descriptionrqwrq", category: category, images: [""]),
//            ItemModel(id: 10, title: "title 10", price: 421, description: "descriptionrqwrqr", category: category, images: [""]),
//            ItemModel(id: 11, title: "title 11", price: 121, description: "descriptionrqwrqw", category: category, images: [""]),
//            ItemModel(id: 12, title: "title 12", price: 124, description: "descriptionrqwrq", category: category, images: [""]),
//            ItemModel(id: 13, title: "title 13", price: 121, description: "descriptionrqrq", category: category, images: [""]),
//            ItemModel(id: 14, title: "title 14", price: 121, description: "descriptionrqwrq", category: category, images: [""]),
//            ItemModel(id: 15, title: "title 15", price: 231, description: "descriptionrqwqwr", category: category, images: [""])
//        ]
//    }
//}
//
//// diffrent file
//extension Int {
//
//    private var priceFormater: NumberFormatter {
//        let formatter = NumberFormatter()
//        formatter.alwaysShowsDecimalSeparator = true
//        formatter.numberStyle = .decimal
//        formatter.locale = .current
//        formatter.currencyCode = "EUR"
//        formatter.currencySymbol = "￡"
//        formatter.maximumIntegerDigits = 3
//        formatter.minimumIntegerDigits = 1
//        formatter.minimumFractionDigits = 2
//        formatter.maximumIntegerDigits = 3
//        return formatter
//    }
//
//    func formatPrice() -> String {
//        let number = NSNumber(value: self)
//        return priceFormater.string(from: number) ?? "0"
//    }
//}
//// diffrent file
//
//@MainActor
//final class ItemsListViewModel: ObservableObject {
//    @Published private(set) var models: [ItemModel] = []
//    @Published var state: ViewsToDisplay = .downloading
//    private let itemDataServicingMock: ItemDataServiceMock
//
//    init(itemDataServicingMock: ItemDataServiceMock) {
//        self.itemDataServicingMock = itemDataServicingMock
//
//    }
//
//    func fetchItems() async throws {
//        do {
//            let item = try await itemDataServicingMock.downloadItemAsync()
//            self.state = item.isEmpty ? .error("empty") : .mainView
//        } catch {
//            self.state = .error(error.localizedDescription)
//        }
//    }
//
//    func showFavorite() {
//
//    }
//
//    func fitreadItems() {
//
//    }
//}
//// diffrent file
//
//final class ItemViewModel: ObservableObject {
//    @Published private(set) var model: ItemModel
//
//    init(model: ItemModel) {
//        self.model = model
//    }
//    func isFavorite() {
//        model.favorite?.toggle()
//    }
//    var image: String? {
//        model.images?.first
//    }
//
//    var title: String {
//        model.title ?? ""
//    }
//
//    var price: String? {
//        model.price?.formatPrice() ?? "0"
//    }
//}
//// diffrent file
//
//struct ErrorView: View {
//    let imageEmoji = "😱"
//    var body: some View {
//        VStack {
//            Image(systemName: "xmark")
//                .resizable()
//                .scaledToFit()
//                .font(.headline)
//                .foregroundColor(.red)
//                .frame(width: 200, height: 200, alignment: .center)
//
//            Text("Something went wrong never try again")
//                .font(.headline)
//                .padding()
//            Spacer()
//            Text(imageEmoji)
//                .font(.system(size: 100))
//            Spacer()
//        }
//    }
//}
//struct ErrorView_Previews: PreviewProvider {
//    static var previews: some View {
//        ErrorView()
//    }
//}
//// diffrent file
//
//@MainActor
//struct ItemListView: View {
//    @StateObject var viewModel: ItemsListViewModel
//    @State var textField = ""
//
//    var body: some View {
//        NavigationView {
//            List {
//                TextField("search", text: $textField)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(height: 50)
//                    .frame(maxWidth: .infinity)
//                    .keyboardType(.default)
//                    .submitLabel(.done)
//                    .onSubmit {
//                        viewModel.fitreadItems()
//                    }
//                ForEach(viewModel.models) { item in
//                    NavigationLink(destination: ItemDetailsView()) {
//                        CellView(viewModel:ItemViewModel(model: item))
//                    }
//                }
//            }
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationTitle("items")
//            .toolbar {
//                ToolbarItem(placement: .automatic) {
//                    Button {
//                        viewModel.showFavorite()
//                    } label: {
//                        Text("favorite")
//                    }
//                    Button {
//
//                    } label: {
//                        Text("add")
//                    }
//                }
//            }
//            .onAppear {
//                Task {
//                    try await viewModel.fetchItems()
//                }
//            }
//        }
//    }
//}
//struct ItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        //        let model = ItemModel(id: 4, title: "321", price: 321, description: "asd", category: nil, images: nil)
//        let model = ItemDataServiceMock()
//        let viewModel = ItemsListViewModel(itemDataServicingMock: model)
//        ItemListView(viewModel: viewModel)
//    }
//}
//// diffrent file
//
//struct CellView: View {
//    @StateObject var viewModel: ItemViewModel
//
//    var body: some View {
//        VStack {
//            if let imageUrl = viewModel.image {
//                AsyncImage(url: URL(string: imageUrl)) { image in
//                    image
//                        .resizable()
//                        .scaledToFit()
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                } placeholder: {
//                    ProgressView()
//                }
//                .frame(width: 50, height: 50)
//            }
//        VStack(spacing: 10) {
//            Text(viewModel.title)
//                .font(.headline)
//            HStack {
//                Image(systemName: "heart")
//            }
//
//            Spacer()
//
//            Text(viewModel.price ?? "")
//                .font(.subheadline)
//            }
//        }
//    }
//}
//struct CellView_Previews: PreviewProvider {
//    static var previews: some View {
//        let model = ItemModel(id: 4, title: "eq", price: 123, description: "eqewq", category: nil, images: [""])
//        let viewModel = ItemViewModel(model: model)
//        CellView(viewModel: viewModel)
//    }
//}
//
//// diffrent file
//
//struct ItemDetailsView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct ItemDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemDetailsView()
//    }
//}
////diffrent file
