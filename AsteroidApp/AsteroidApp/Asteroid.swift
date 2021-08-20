//
//  Asteroid.swift
//  AsteroidApp
//
//  Created by Ceren Çiçek on 19.08.2021.
//

import Foundation


struct Data : Decodable {
    var element_count: Int
    var near_earth_objects: Dates

}

struct Dates : Codable {
    var date : [Asteroid]

    enum CodingKeys: String, CodingKey {
        case date = "2021-08-20"
    }
}


struct Asteroid : Codable {
    var id: String
    var name: String
    var absolute_magnitude_h: Double
    var is_potentially_hazardous_asteroid: Bool
    var estimated_diameter: EstimatedDiameter
    var close_approach_data: [CloseApproachData]
}

struct EstimatedDiameter : Codable {
    var kilometers: Kilometers
}

struct Kilometers : Codable {
    var estimated_diameter_min: Double
    var estimated_diameter_max: Double
}

struct CloseApproachData : Codable {
    var close_approach_date_full: String
    var relative_velocity: RelativeVelocity
    var miss_distance: MissDistance
}

struct RelativeVelocity : Codable {
    var kilometers_per_second: String
    var kilometers_per_hour: String
}

struct MissDistance : Codable {
    var astronomical: String
    var lunar: String
    var kilometers: String
    var miles: String
}
