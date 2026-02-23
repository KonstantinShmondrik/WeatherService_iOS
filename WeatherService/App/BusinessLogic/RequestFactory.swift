//
//  RequestFactory.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 22.02.2026.
//


import Foundation
import Alamofire

class RequestFactory {

    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }

    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default

        let logger = NetworkLogger()

        let manager = Session(configuration: configuration, eventMonitors: [logger])
        return manager
    }()

    let sessionQueue = DispatchQueue.global(qos: .utility)

    // MARK: - Current Weather
    func makeCurrentWeatherRequestFactory() -> CurrentWeatherServiceProtocol {
        let errorParser = makeErrorParser()
        return CurrentWeatherService(errorParser: errorParser,
                           sessionManager: commonSession,
                           queue: sessionQueue)
    }

    // MARK: - Forecast Weather
    func makeForecastWeatherRequestFactory() -> ForecastWeatherServiceProtocol {
        let errorParser = makeErrorParser()
        return ForecastWeatherService(errorParser: errorParser,
                           sessionManager: commonSession,
                           queue: sessionQueue)
    }


}
