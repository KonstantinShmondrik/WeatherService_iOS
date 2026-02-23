//
//  CurrentWeatherService.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 22.02.2026.
//


import UIKit
import Alamofire

protocol CurrentWeatherServiceProtocol {
    func getCurrentWeather(for coordinate: Coordinate, completionHandler: @escaping (AFDataResponse<WeatherResponse>) -> Void)
}

class CurrentWeatherService: AbstractRequestFactory {

    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue

    let baseUrl = URL(string: Endpoints.baseURL)

    init (
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)
    ) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension CurrentWeatherService: CurrentWeatherServiceProtocol {

    func getCurrentWeather(for coordinate: Coordinate, completionHandler: @escaping (AFDataResponse<WeatherResponse>) -> Void) {
        guard let baseUrl else { return }
        let requestModel = Get(
            baseURL: baseUrl,
            coordinate: coordinate
        )
        self.request( request: requestModel, completionHandler: completionHandler)
    }
}

extension CurrentWeatherService {

    struct Get: RequestRouter {
        let headers: HTTPHeaders? = nil
        let baseURL: URL
        let metod: HTTPMethod = .get
        let path: String = Endpoints.currentWeatherAPI
        let key: String = Config.apiKey.rawValue
        let coordinate: Coordinate

        var parameters: Parameters? {
            return [
                "key": key,
                "q": "\(coordinate.latitude),\(coordinate.longitude)"
            ]
        }
    }
}
