import Foundation
struct Spacer {
    func line(_ title: String? = "-") {
        print("\n *-*-*-*-*-*-*-*-*-*\(title!)*-*-*-*-*-*-*-*-*-* \n")
    }
}
let spacer = Spacer()
/**
 **2.Ene.2023**
##Foundation##
[Using dates safely and effectively
](https://www.hackingwithswift.com/plus/making-the-most-of-foundation/using-dates-safely-and-effectively)
**/

spacer.line("Unit Length")

let distanceScandinavianMiles = Measurement(value: 1, unit: UnitLength.scandinavianMiles)
let distanceFathoms = Measurement(value: 1, unit: UnitLength.fathoms)
let distanceFurlongs = Measurement(value: 1, unit: UnitLength.furlongs)
let distanceParsecs = Measurement(value: 1, unit: UnitLength.parsecs)
let distanceAstronomicalUnits = Measurement(value: 1, unit: UnitLength.astronomicalUnits)
let distanceMegameters = Measurement(value: 1, unit: UnitLength.megameters)

let distances = [distanceScandinavianMiles,
                 distanceFathoms,
                 distanceParsecs,
                 distanceFurlongs,
                 distanceMegameters,
                 distanceAstronomicalUnits]

for distance in distances {
    print("\(distance.description) = \(distance.converted(to: UnitLength.meters) ) meters")
    
}

spacer.line("Unit Mass")
let weightPounds = Measurement(value: 1, unit: UnitMass.pounds)
let weightCarats = Measurement(value: 1, unit: UnitMass.carats)
let weightOuncesTroy = Measurement(value: 1, unit: UnitMass.ouncesTroy)
let weightSlugs = Measurement(value: 1, unit: UnitMass.slugs)
let weightStones = Measurement(value: 1, unit: UnitMass.stones)
let weightShortTons = Measurement(value: 1, unit: UnitMass.shortTons)
let weights = [weightPounds,
                weightCarats,
                weightOuncesTroy,
                weightSlugs,
                weightStones,
                weightShortTons]
for weight in weights {
    print("\(weight.description) = \(weight.converted(to: UnitMass.kilograms))")
}

spacer.line("Unit Duration")
let durationSeconds = Measurement(value: 4671, unit: UnitDuration.seconds)
let durationMinutes = Measurement(value: 1715, unit: UnitDuration.minutes)
let durations = [durationSeconds, durationMinutes]

for duration in durations {
    print("\(duration.description) = \(duration.converted(to: UnitDuration.hours))")
}

spacer.line("Unit Area")

let areaAcreas = Measurement(value: 1, unit: UnitArea.acres)
let areaAres = Measurement(value: 1, unit: UnitArea.ares)
let areas = [areaAres, areaAcreas]
for area in areas {
    print("\(area.description) = \(area.converted(to: UnitArea.squareMeters))")
}

spacer.line("Unit Angle")

let angleArcSeconds = Measurement(value: 1, unit: UnitAngle.arcSeconds)
let angleArcMinutes = Measurement(value: 1, unit: UnitAngle.arcMinutes)
let angleDegrees = Measurement(value: 1, unit: UnitAngle.degrees)
let angleGradians = Measurement(value: 1, unit: UnitAngle.gradians)
let angleRadians = Measurement(value: 1, unit: UnitAngle.radians)
let angleRevolutions = Measurement(value: 1, unit: UnitAngle.revolutions)
let angles = [angleArcSeconds,
                angleArcMinutes,
                angleDegrees,
                angleGradians,
                angleRadians,
                angleRevolutions]
for angle in angles {
    print("\(angle.description) = \(angle.converted(to: UnitAngle.degrees))")
}

spacer.line("Unit Power")
let powerHorsePower = Measurement(value: 1, unit: UnitPower.horsepower)
let powerFemtowatt = Measurement(value: 1, unit: UnitPower.femtowatts)
let powers = [powerHorsePower, powerFemtowatt]
for power in powers {
    print("\(power.description) = \(power.converted(to: UnitPower.watts))")
}

spacer.line("Unit Speed")

let speedKnots = Measurement(value: 1, unit: UnitSpeed.knots)
print("\(speedKnots.description) = \(speedKnots.converted(to: UnitSpeed.kilometersPerHour))")

spacer.line("Unit Temperature")

let temperatureKelvin = Measurement(value: 1, unit: UnitTemperature.kelvin)
let temperatureFahrenheit = Measurement(value: 1, unit: UnitTemperature.fahrenheit)
let temperatures = [temperatureKelvin, temperatureFahrenheit]

for temp in temperatures {
    print("\(temp.description) = \(temp.converted(to: UnitTemperature.celsius))")
}
spacer.line("Formatting measurements")

let localeIdentifiers = ["en_GB","en_US","fr_FR","en_AU"]

for identifier in localeIdentifiers {
    let formatter = MeasurementFormatter()
    formatter.locale = Locale(identifier: identifier)
    print("\(formatter.string(from: weightStones)) & \(formatter.string(from: distanceScandinavianMiles)) \n")
}
spacer.line("Operator overloading")

let totalDistance = distanceScandinavianMiles + distanceFurlongs

print(totalDistance)

let remainingAngle = angleRevolutions  - angleArcMinutes

print(remainingAngle)

let remainingWeight = weightSlugs - (weightCarats * 15)
print(remainingWeight)

if powerHorsePower > powerFemtowatt {
    print("horPower > Femtowatt: \(powerHorsePower > powerFemtowatt)")
} else {
    print("horPower < Femtowatt: \(powerHorsePower > powerFemtowatt)")
}

let durationRange = durationSeconds...durationMinutes
print(durationRange)

