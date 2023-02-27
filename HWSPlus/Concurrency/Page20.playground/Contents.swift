import Foundation

func fetchNews() async -> Data? {
    do {
        let url = URL(string: "https://hws.dev/news-1.json")!
        let (data,_) = try await URLSession.shared.data(from: url)
        return data
    } catch {
        print("Failed to fetch data")
        return nil
    }
}

if let data = await fetchNews() {
    print("Downloaded \(data.count) bytes")
} else {
    print("Download failed")
}
