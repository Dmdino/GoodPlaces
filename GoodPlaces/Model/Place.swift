//
//  Place.swift
//  GoodPlaces
//
//  Created by Дмитрий Папушин on 16.01.2021.
//

import Foundation

struct Place: Codable {
    var name: String?
    var location: String?
    var type: String?
    var image: String?
    
    static let restaurantNames = [
        "Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
        "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
        "Speak Easy", "Morris Pub", "Вкусные истории",
        "Классик", "Love&Life", "Шок", "Бочка"
    ]
    
    static func getPlaces() -> [Place] {
        
        var places = [Place]()
        restaurantNames.forEach { place in places.append(Place(name: place, location: "Москва", type: "Бар", image: place))}

        return places
        
    }
    
}

//        for place in restaurantNames {
//            places.append(Place(name: place, location: "Moscow", type: "Bar", image: place))
//        }
