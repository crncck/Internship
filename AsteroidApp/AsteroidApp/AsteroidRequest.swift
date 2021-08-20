//
//  AsteroidRequest.swift
//  AsteroidApp
//
//  Created by Ceren Çiçek on 20.08.2021.
//

import Foundation

enum AsteroidError : Error {
    case noDataAvailable
    case canNotProcessData
}

struct AsteroidRequest {

    let url : URL
    let API_KEY = "ZdxhftHUzXt4vHb8fIu08G42SmIxg6sEpabVXodW"

    init(date: String) {

        let urlString = "https://api.nasa.gov/neo/rest/v1/feed?start_date=\(date)&end_date=\(date)&api_key=\(API_KEY)"
        guard let url = URL(string: urlString) else { fatalError() }
        self.url = url

    }

    func getAsteroid(completion: @escaping(Result<[Asteroid], AsteroidError>) -> Void) {

        let session = URLSession.shared

        let dataTask = session.dataTask(with: url) { (data, response, error) in

            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }

            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode(Data.self, from: jsonData)
                let asteroids = data.near_earth_objects.date
                completion(.success(asteroids))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()

    }
}

