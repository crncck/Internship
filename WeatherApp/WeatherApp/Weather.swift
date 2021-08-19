//
//  Weather.swift
//  WeatherApp
//
//  Created by Ceren Çiçek on 18.08.2021.
//

import Foundation

struct Weather : Decodable {
    var location : Location
    var current : Current
}

struct Location : Decodable {
    var name: String
    var country: String
}

struct Current : Decodable {
    var temp_c : Double
    var condition : ConditionInfo
    var wind_kph : Double
    var wind_dir : String
    var humidity: Int
    var cloud : Int
    var feelslike_c : Double
}

struct ConditionInfo : Decodable {
    var text : String
}
