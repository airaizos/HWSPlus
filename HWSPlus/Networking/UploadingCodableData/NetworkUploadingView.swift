//
//  NetworkUploadingView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 9/2/23.
//

import SwiftUI

struct NetworkUploadingView: View {
    @State private var receivedBackGeneric = ""
    
    private var networkUploading = NetworkUploading()
    private let star = MovieStar(name: "Tilda Swinton", movies: ["Tres mil años Esperándote","Sólo los amantes sobreviven"])
    private let url = URL(string: "https://reqres.in/api/users")!
    private let product = Product(id: 1157, title: "iphone 158 Premium Diamond", description: "The best iphone we've ever created", price: 115_157, rating: 7.8, stock: 1517, brand: "Apple", category: "smarthpone", thumbnail: "https://i.dummyjson.com/data/products/100/thumbnail.jpg")
    
    // Segundo Ejemplo
    private let dummyUrl = URL(string: "https://dummyjson.com/products/add")!
    
    
    var body: some View {
        VStack {
            Button("Send Data") {
                networkUploading.upload(star, to: url)
            }
            Button("Send Generic Data") {
                networkUploading.uploadGeneric(product, to: dummyUrl) { (result: Result<Product, UploadError>) in
                    switch result {
                    case .success(let product):
                        receivedBackGeneric = product.title
                        print("Received back: \(product.title)")
                    case .failure(let error):
                        print(error)
                        break
                    }
                }
            }
            Text("Response:\n \(Text(receivedBackGeneric.localizedUppercase).bold().foregroundColor(.classicBlue))")

        }
    }
}
    struct NetworkUploadingView_Previews: PreviewProvider {
        static var previews: some View {
            NetworkUploadingView()
        }
    }
