import Foundation

func getAverageTemperature() async {
    let fetchTask = Task { () -> Double in
        let url = URL(string: "https://hws.dev/readings.json")!
       let (data,_) = try await URLSession.shared.data(from: url)
        try Task.checkCancellation()
        if Task.isCancelled { return 0 }
        let readings = try JSONDecoder().decode([Double].self, from: data)
        let sum = readings.reduce(0,+)
        print("Calculating temperature...")
        try await Task.sleep(for: .seconds(3))
        return sum / Double(readings.count)
    }
    do {
     
        let result = try await fetchTask.value
   //     fetchTask.cancel()
     //   print(fetchTask.isCancelled)
       
        print("Average temperature: \(result)")
    } catch {
        print("Failed to get Data")
    }
}

await getAverageTemperature()
