//
//  ErrorView.swift
//  ListOfItems
//
//  Created by piotr koscielny on 04/03/2025.
//

import SwiftUI

struct ErrorView: View {
    let imageEmoji = "😱"
    var body: some View {
        VStack {
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .font(.headline)
                .foregroundColor(.red)
                .frame(width: 200, height: 200, alignment: .center)
            
            Text("Something went wrong never try again")
                .font(.headline)
                .padding()
            Spacer()
            Text(imageEmoji)
                .font(.system(size: 100))
            Spacer()
        }
    }
}
struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
