//
//  ViewController.swift
//  WeatherApp
//
//  Created by Ceren Çiçek on 17.08.2021.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var imageWeather: UIImageView!
    @IBOutlet weak var lblCondition: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblFeelsLike: UILabel!
    @IBOutlet weak var lblWindSpeed: UILabel!
    @IBOutlet weak var lblWindDirection: UILabel!
    @IBOutlet weak var txtCity: UITextField!

    let API_KEY = "6f7ecd892a2143ddb9261949211808"

    var city = "Istanbul"

    override func viewDidLoad() {
        super.viewDidLoad()

        backView.layer.cornerRadius = 30
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOpacity = 1
        backView.layer.shadowOffset = .zero
        backView.layer.shadowRadius = 10

        getWeather(city: city)

    }

    @IBAction func btnSearchClicked(_ sender: Any) {

        guard let city = txtCity.text else { return }

        getWeather(city: city)

    }


    func getWeather(city: String) {

        lblCity.text = city

        var condition = ""
        var temp_c = -1

        let urlString = "http://api.weatherapi.com/v1/current.json?key=\(API_KEY)&q=\(city)&aqi=no"

        let url = URL(string: urlString)

        guard url != nil else { return }

        let session = URLSession.shared

        let dataTask = session.dataTask(with: url!) { [self] (data, response, error) in

            if error == nil && data != nil {

                let decoder = JSONDecoder()

                do {

                    let weather = try decoder.decode(Weather.self, from: data!)

                    condition = weather.current.condition.text
                    temp_c = Int(weather.current.temp_c)

                    DispatchQueue.main.async {
                        lblCondition.text = condition
                        lblTemp.text = String(temp_c)
                        lblHumidity.text = String(weather.current.humidity)
                        lblFeelsLike.text = String(weather.current.feelslike_c)
                        lblWindSpeed.text = String(weather.current.wind_kph)
                        lblWindDirection.text = weather.current.wind_dir

                        switch condition {
                        case "Partly cloudy":
                            imageWeather.image = UIImage(named: "partly_cloudy")
                        case "Cloudy":
                            imageWeather.image = UIImage(named: "cloudy")
                        default:
                            imageWeather.image = UIImage(named: "sunny")
                        }
                    }

                } catch {
                    print("Error in JSON parsing")
                }
            }
        }
        dataTask.resume()
    }
}
