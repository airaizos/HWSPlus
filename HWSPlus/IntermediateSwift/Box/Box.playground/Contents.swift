import Foundation

struct Song {
    var name: String
    var artist: String
    var year: Int
}
extension Song: Equatable {
    static func ==(lhs: Song, rhs: Song) -> Bool {
        lhs.name == rhs.name &&
        lhs.artist == rhs.artist &&
        lhs.year == rhs.year
    }
    
}


final class Box<Type> {
    var value: Type
    init(_ value: Type) {
        self.value = value
    }
    
    func map<Other>(_ function: (Type) throws -> Other) rethrows -> Box<Other> {
        
        Box<Other>(try function(value))
    }
}

let year = "2000"

let boxedYear = Box(year)

let boxedYearInt = boxedYear.map { Int($0) }

let heavenMust = Song(name: "Heaven must have sent you", artist: "Bonnie Pointer", year: 2000)

let boxedSong = Box(heavenMust)
let secondBoxSong = boxedSong
let thirdBoxSong = boxedSong

thirdBoxSong.value.year = 1990
print(boxedSong.value.year)
print(secondBoxSong.value.year)
print(thirdBoxSong.value.year)


let score = 10
let boxedScore = Box(score)
let secondBoxScore = boxedScore
let thirdBoxScore = boxedScore

thirdBoxScore.value = 15
print(thirdBoxScore)


extension Box: CustomStringConvertible where Type: CustomStringConvertible {
    var description: String {
        value.description
    }
}
print(thirdBoxScore,terminator: "\n")

extension Box: Equatable where Type: Equatable {
    static func ==(lhs: Box, rhs: Box) -> Bool {
        lhs.value == rhs.value
    }
}

//print(score == score, terminator: "\n")

extension Box: Comparable where Type: Comparable {
    static func <(lhs: Box, rhs: Box) -> Bool {
        lhs.value < rhs.value
    }
}

extension Box: Codable  where Type: Codable {
}

/*
extension Box: Decodable  where Type: Decodable {
}

 */
struct Album {
    var song: Box<Song>
}

struct Spotify {
    var song: Box<Song>
}

let greatestHits = Album(song: boxedSong)
let list = Spotify(song: boxedSong)

greatestHits.song.value.year = 1980

print(list.song.value.year)


/// Challenges
/// If you’d like to take this tutorial further, here are some suggestions to try:

/// Can you write a map() method that transforms our boxed value into another kind of boxed value, for example a Box<String> into a Box<Int>?
/// Can you add conformances for Encodable and Decodable? You should not rely on the synthesized conformances, because they will create a nested type with a “value” key.

