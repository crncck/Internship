//
//  DetailsViewController.swift
//  AsteroidApp
//
//  Created by Ceren Çiçek on 20.08.2021.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblAbsoluteMagnitude: UILabel!
    @IBOutlet weak var lblPotentiallyHazard: UILabel!
    @IBOutlet weak var lblMinEstimatedDia: UILabel!
    @IBOutlet weak var lblMaxEstimatedDia: UILabel!
    @IBOutlet weak var lblFullDate: UILabel!
    @IBOutlet weak var lblRelativeVelocitySecond: UILabel!
    @IBOutlet weak var lblRelativeVelocityHour: UILabel!
    @IBOutlet weak var lblDistanceAstro: UILabel!
    @IBOutlet weak var lblDistanceLunar: UILabel!
    @IBOutlet weak var lblDistanceKm: UILabel!
    @IBOutlet weak var lblDistanceMiles: UILabel!

    var chosenIndex = 0

    var listOfAsteroids = [Asteroid]() {
        didSet {
            DispatchQueue.main.async {
                let asteroid = self.listOfAsteroids[self.chosenIndex]
                self.lblName.text = asteroid.name
                self.lblID.text = asteroid.id
                self.lblAbsoluteMagnitude.text = String(asteroid.absolute_magnitude_h)
                self.lblPotentiallyHazard.text = String(asteroid.is_potentially_hazardous_asteroid)
                self.lblMinEstimatedDia.text = "\(String(asteroid.estimated_diameter.kilometers.estimated_diameter_min)) km"
                self.lblMaxEstimatedDia.text = "\(String(asteroid.estimated_diameter.kilometers.estimated_diameter_max)) km"
                self.lblFullDate.text = asteroid.close_approach_data[0].close_approach_date_full
                self.lblRelativeVelocitySecond.text = "\(asteroid.close_approach_data[0].relative_velocity.kilometers_per_second) km/sec"
                self.lblRelativeVelocityHour.text = "\(asteroid.close_approach_data[0].relative_velocity.kilometers_per_hour) km/h"
                self.lblDistanceAstro.text = asteroid.close_approach_data[0].miss_distance.astronomical
                self.lblDistanceLunar.text = asteroid.close_approach_data[0].miss_distance.lunar
                self.lblDistanceKm.text = asteroid.close_approach_data[0].miss_distance.kilometers
                self.lblDistanceMiles.text = asteroid.close_approach_data[0].miss_distance.miles

            }
        }
    }

    let currentDate = Date()
    let format = DateFormatter()
    var cdate = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        format.dateFormat = "yyyy-MM-dd"
        cdate = format.string(from: currentDate)

        backView?.layer.cornerRadius = 50

        let asteroidRequest = AsteroidRequest(date: cdate)
        asteroidRequest.getAsteroid { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let asteroids):
                self?.listOfAsteroids = asteroids
            }
        }
    }


}
