//
//  ViewController.swift
//  AsteroidApp
//
//  Created by Ceren Çiçek on 19.08.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var imageMain: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblObjectCount: UILabel!

    var chosenIndex = 0
    let currentDate = Date()
    let format = DateFormatter()
    var cdate = ""

    var listOfAsteroids = [Asteroid]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.lblObjectCount.text = "\(String(self.listOfAsteroids.count)) Objects Found"
            }
        }
    }

    let API_KEY = "ZdxhftHUzXt4vHb8fIu08G42SmIxg6sEpabVXodW"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        tableView.delegate = self
        tableView.dataSource = self

        format.dateFormat = "yyyy-MM-dd"
        cdate = format.string(from: currentDate)
        lblDate.text = cdate

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

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 101
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfAsteroids.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AsteroidCell {

            let asteroid = listOfAsteroids[indexPath.row]

            cell.lblIndex.text = String(indexPath.row + 1)
            cell.lblName.text = asteroid.name
            cell.lblVelocity.text = "\(asteroid.close_approach_data[0].relative_velocity.kilometers_per_hour) km/h"

            return cell
        }

        return UITableViewCell()

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenIndex = indexPath.row
        performSegue(withIdentifier: "goDetails", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsViewController = segue.destination as? DetailsViewController {
            detailsViewController.chosenIndex = chosenIndex
        }
    }

}



