//
//  RemoteImage.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 12/1/23.
//


import SwiftUI

struct RemoteImage: View {
    private enum LoadState {
        case loading, success, failure
    }
    
    private final class Loader: ObservableObject {
        var data = Data()
        var state = LoadState.loading
        
        
        /// Inicializador para cargar la imagen como (Image("stringUrl"))
        init(url: String) {
            guard let parsedURL = URL(string: url) else {
                fatalError("Invalid URL: \(url)")
            }
            
            URLSession.shared.dataTask(with: parsedURL) { data, response, error in
                
                DispatchQueue.main.async {
                    if let data = data, data.count > 0 {
                        self.data = data
                        self.state = .success
                    } else {
                        self.state = .failure
                    }
                    self.objectWillChange.send()
                }
            }.resume()
            
        }
    }
    
    //  MARK: Init
    init(url: String, loading: Image = Image(systemName: "photo"), failure: Image = Image(systemName: "multiply.circle")) {
        _loader = StateObject(wrappedValue: Loader(url: url))
        self.loading = loading
        self.failure = failure
    }
    
    // MARK: Variables
    @StateObject private var loader: Loader
    var loading: Image
    var failure: Image
    
    
    //  MARK: View
    var body: some View{
        selectImage()
            .resizable()
    }
    
    //  MARK: Functions
    
    /// Siempre devuelve una imagen cargando, fallido, o imagen
    private func selectImage() -> Image {
        switch loader.state {
        case .loading:
            return loading
        case .failure:
            return failure
        default:
            if let image = UIImage(data: loader.data) {
                return Image(uiImage: image)
            } else {
                return failure
            }
        }
    }
    
}


///#Challenges#
///If you’d like to take this project further, here are some suggestions to get you started:
/// Can you add an in-memory cache that stores images for specific URLs? You could back this by NSCache if you wanted.
///Can you upgrade your in-memory cache to a long-term cache using device storage? This would mean writing your image data to the user’s caches directory so it persists across app runs.
