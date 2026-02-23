//
//  LocationService.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 23.02.2026.
//


import CoreLocation

enum LocationError: Error {
    case denied
    case noLocation
    case unknown
}

protocol LocationServiceProtocol: AnyObject {

    func getLocation( completion: @escaping (Result<Coordinate, Error>) -> Void)
}

final class LocationService: NSObject, LocationServiceProtocol {

    private let locationManager = CLLocationManager()
    private var completion: ((Result<Coordinate, Error>) -> Void)?

    override init() {
        super.init()
        locationManager.delegate = self
    }

    private func finish(with result: Result<Coordinate, Error>) {
        completion?(result)
        completion = nil
    }

    func getLocation(completion: @escaping (Result<Coordinate, Error>) -> Void) {
        self.completion = completion

        let status = locationManager.authorizationStatus

        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()

        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.requestLocation()

        case .denied, .restricted:
            finish(with: .failure(LocationError.denied))

        @unknown default:
            finish(with: .failure(LocationError.unknown))
        }
    }
}

extension LocationService: CLLocationManagerDelegate {

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus

        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            manager.requestLocation()

        case .denied, .restricted:
            finish(with: .failure(LocationError.denied))

        default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            finish(with: .failure(LocationError.noLocation))
            return
        }

        let coordinate = Coordinate(
            latitude: location.coordinate.latitude,
            longitude: location.coordinate.longitude
        )

        finish(with: .success(coordinate))
        completion = nil
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        finish(with: .failure(error))
        completion = nil
    }
}
