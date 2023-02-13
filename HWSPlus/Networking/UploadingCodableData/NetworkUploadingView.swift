//
//  NetworkUploadingView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 9/2/23.
//

import SwiftUI

struct NetworkUploadingView: View {
    @State private var receivedBackGeneric = ""
    @State private var receivedBackGenericCombine = ""
    @State private var receiveBack = ""
    
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
                        receivedBackGeneric = "\(error)"
                        break
                    }
                }
            }
            Text("Response:\n \(Text(receivedBackGeneric.localizedUppercase).bold().foregroundColor(.classicBlue))")
            
            Button("Send Generica Data with Combine") {
                receivedBackGenericCombine = "downloading..."
                networkUploading.uploadGeneric(product, to: dummyUrl) { (result: Result<Product,UploadError>) in
                    switch result {
                    case .success(let product):
                        receivedBackGenericCombine = product.thumbnail
                        print("Received back: \(product.id) - \(product.title)")
                    case .failure(let error):
                        receivedBackGenericCombine = "\(error)"
                        break
                    }
                }
            }
            Text("Response:")
            AsyncImage(url: URL(string: receivedBackGenericCombine)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                if receivedBackGenericCombine.hasPrefix("d") {
                    ProgressView()
                }
            }
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
            Button("Send Generic data with dates") {
                networkUploading.uploadCombine(star, to: url) { (result: Result<MovieStar, UploadError>) in
                    
                    switch result {
                    case .success(let info):
                        if let createdAt = info.createdAt {
                            receiveBack = createdAt
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
            }
            Text(receiveBack)
        }
    }
}
    struct NetworkUploadingView_Previews: PreviewProvider {
        static var previews: some View {
            NetworkUploadingView()
        }
    }
