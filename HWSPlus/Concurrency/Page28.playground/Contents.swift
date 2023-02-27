import SwiftUI

func proccessWeather() async {
    
}


@main
struct MainApp{
    static func main() async {
        await proccessWeather()
    }
}


struct Page28View: View {
    @State private var sourceCode = ""
    
    
    var body: some View {
        ScrollView {
            Text(sourceCode)
        }
        .task {
            await fetchSource()
        }
    }
    func fetchSource() async {
        do {
            let url = URL(string: "https://proximaparadaswift.dev")!
            
            let (data,_) = try await URLSession.shared.data(from: url)
            sourceCode = String(decoding: data, as: UTF8.self).trimmingCharacters(in: .whitespacesAndNewlines)
        } catch {
            sourceCode = "Failed to fetch Próxima Parada Swift"
        }
    }
    
}

