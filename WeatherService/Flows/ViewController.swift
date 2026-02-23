//
//  ViewController.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 22.02.2026.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    private let requestFactory = RequestFactory()

   private let moscowsCoordinate = Coordinate(latitude: 55.7558, longitude: 37.6173)

    private func getCurrentWeather(for coordinate: Coordinate) async throws -> WeatherResponse {
        let currentWeatherFactory = requestFactory.makeCurrentWeatherRequestFactory()
        return try await withCheckedThrowingContinuation { continuation in
            currentWeatherFactory.getCurrentWeather(for: coordinate) { response in
                switch response.result {
                case .success(let result):
                    continuation.resume(returning: result)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func getForecastWeather(for coordinate: Coordinate) async throws -> WeatherResponse {
        let currentWeatherFactory = requestFactory.makeForecastWeatherRequestFactory()
        return try await withCheckedThrowingContinuation { continuation in
            currentWeatherFactory.getForecastWeather(for: coordinate) { response in
                switch response.result {
                case .success(let result):
                    continuation.resume(returning: result)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func getWeather(for coordinate: Coordinate) {
        Task {
            do {
                async let current = getCurrentWeather(for: coordinate)
                async let forecast = getForecastWeather(for: coordinate)

                let currentResponse = try await current
                let forecastResponse = try await forecast

                let model = WeatherScreenMapper.map(
                    currentResponse: currentResponse,
                    forecastResponse: forecastResponse
                )
                await MainActor.run {
                    Logger.log("\(model)", level: .debug)
    //                view?.showWeather(model)
                    view.applyGradient(
                        colors: model.current.colors,
                        locations: view.gradientLocations(for: model.current.colors)
                    )
                }

            } catch {
                Logger.log("Loading sequence failed: \(error.localizedDescription)", level: .error)
//                view?.showError(error.localizedDescription)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        getWeather(for: moscowsCoordinate)
    }
}
