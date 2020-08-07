import UIKit


struct ResponseObj: Codable {
    var results: [Person]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct Person: Codable {
    
    var name: String
    var hair_color: String
    var eye_color: String
    var homeworld: String
    var films: [String]
    
    enum CodingKeys: String, CodingKey {
        case name, hair_color, eye_color, homeworld, films
    }
}

struct HomeWorld: Codable {
    var name: String

    enum CodingKeys: String, CodingKey {
        case name
    }
}

struct Film: Codable {
    var title: String

    enum CodingKeys: String, CodingKey {
        case title
    }
}


