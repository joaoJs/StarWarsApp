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


// name, eye color, hair color, homeworld name

//struct PokeForm: Codable {
//    var sprites: [String: String]
//
//    enum CodingKeys: String, CodingKey {
//        case sprites
//    }
//}

//"results": [
//{
//    "name": "Anakin Skywalker",
//    "height": "188",
//    "mass": "84",
//    "hair_color": "blond",
//    "skin_color": "fair",
//    "eye_color": "blue",
//    "birth_year": "41.9BBY",
//    "gender": "male",
//    "homeworld": "http://swapi.dev/api/planets/1/",
//    "films": [
//        "http://swapi.dev/api/films/4/",
//        "http://swapi.dev/api/films/5/",
//        "http://swapi.dev/api/films/6/"
//    ],
//    "species": [],
//    "vehicles": [
//        "http://swapi.dev/api/vehicles/44/",
//        "http://swapi.dev/api/vehicles/46/"
//    ],
//    "starships": [
//        "http://swapi.dev/api/starships/39/",
//        "http://swapi.dev/api/starships/59/",
//        "http://swapi.dev/api/starships/65/"
//    ],
//    "created": "2014-12-10T16:20:44.310000Z",
//    "edited": "2014-12-20T21:17:50.327000Z",
//    "url": "http://swapi.dev/api/people/11/"
//},
