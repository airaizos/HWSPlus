import Foundation

func fetchWeatherHistory() async -> [Double] {
    (1...100_000).map { _ in Double.random(in: -10...30)}
}

func calculateAverageTemperatura(for records: [Double]) async -> Double {
    let total = records.reduce(0, +)
    let average = total / Double(records.count)
    return average
}

func upload(result: Double) async -> String {
    "OK"
}

func processWeather() async {
    let records = await fetchWeatherHistory()
    let average = await calculateAverageTemperatura(for: records)
    let response = await upload(result: average)
    print("Server response: \(response)")
}


await processWeather()

