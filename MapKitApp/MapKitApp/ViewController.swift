//
//  ViewController.swift
//  MapKitApp
//
//  Created by Ceren Çiçek on 25.08.2021.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var lblAdress: UILabel!
    @IBOutlet weak var btnGo: UIButton!

    let locationManager = CLLocationManager()
    let locationArea : Double = 12000
    var previousLocation : CLLocation?
    var routes : [MKDirections] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        checkLocationService()

        btnGo.layer.cornerRadius = 10
    }

    func checkLocationService() {

        if CLLocationManager.locationServicesEnabled() {
            setLocationManager()
            checkPermission()
        } else {

        }

    }

    func setLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func checkPermission() {

        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            followLocation()
            break
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            break
        }
    }

    func followLocation() {
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        focusLocation()
        previousLocation = getCenterCoordinates(mapView: mapView)
    }

    func focusLocation() {

        if let location = locationManager.location?.coordinate {
            let area = MKCoordinateRegion.init(center: location, latitudinalMeters: locationArea, longitudinalMeters: locationArea)
            mapView.setRegion(area, animated: true)
        }
    }

    func getCenterCoordinates(mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        return CLLocation(latitude: latitude, longitude: longitude)
    }

    @IBAction func btnGoClicked(_ sender: Any) {
        setRoute()
    }

    func setRoute() {

        guard let startingCoordinate = locationManager.location?.coordinate else { return }

        let request = createRequest(startingCoordinate: startingCoordinate)
        let routes = MKDirections(request: request)
        clearMapView(newRoute: routes)
        routes.calculate { (answer, error) in

            guard let answer = answer else { return }

            for route in answer.routes {
                self.mapView.addOverlay(route.polyline)
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }

        }

    }

    func createRequest(startingCoordinate: CLLocationCoordinate2D) -> MKDirections.Request {

        let targetCoordinate = getCenterCoordinates(mapView: mapView).coordinate
        let startingPoint = MKPlacemark(coordinate: startingCoordinate)

        let targetPoint = MKPlacemark(coordinate: targetCoordinate)

        let request = MKDirections.Request()

        request.source = MKMapItem(placemark: startingPoint)
        request.destination = MKMapItem(placemark: targetPoint)
        request.transportType = .walking
        request.requestsAlternateRoutes = true

        return request
    }

    func clearMapView(newRoute: MKDirections) {
        mapView.removeOverlays(mapView.overlays)
        routes.append(newRoute)

        let _ = routes.map { $0.cancel() }
    }


}

extension ViewController : CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let area = MKCoordinateRegion.init(center: center, latitudinalMeters: locationArea, longitudinalMeters: locationArea)
        mapView.setRegion(area, animated: true)
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkPermission()
    }

}

extension ViewController : MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {

        let center = getCenterCoordinates(mapView: mapView)

        guard let previousLocation = self.previousLocation else { return }
        if center.distance(from: previousLocation) < 50 { return }
        self.previousLocation = center

        let geoCoder = CLGeocoder()
        geoCoder.cancelGeocode()

        geoCoder.reverseGeocodeLocation(center) { (locationSigns, error) in
            if let _ = error {
                print("Error")
                return
            }
            guard let sign = locationSigns?.first else { return }

            let streetNumber = sign.subThoroughfare ?? "Unknown"
            let streetName = sign.thoroughfare ?? "Unknown"
            let countryName = sign.country ?? "Unknown"
            let cityName = sign.administrativeArea ?? "Unknown"
            let districtName = sign.locality ?? "Unknown"

            DispatchQueue.main.async {
                self.lblAdress.text = "\(districtName) / \(cityName) / \(countryName)"
            }

        }
    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {

        let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        renderer.strokeColor = .blue
        renderer.lineWidth = 8
        renderer.lineCap = .square
        return renderer

    }

}
