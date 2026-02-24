//
//  HomePresenter.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 23.02.2026.
//


import UIKit
import Alamofire

final class HomePresenter {

    private let requestFactory = RequestFactory()
    private let locationService = LocationService()

    private let moscowsCoordinate = Coordinate(latitude: 55.7558, longitude: 37.6173)

    private var isLoading = false {
        didSet {
            DispatchQueue.main.async {
                self.viewInput?.loading(self.isLoading)
            }
        }
    }

    weak var viewInput: HomeViewInput?

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
            await MainActor.run {
                self.isLoading = true
            }

            try? await Task.sleep(nanoseconds: 100_000_000) // 0.1 сек

            do {
                async let current = getCurrentWeather(for: coordinate)
                async let forecast = getForecastWeather(for: coordinate)

                let currentResponse = try await current
                let forecastResponse = try await forecast

                let model = WeatherScreenMapper.map(
                    currentResponse: currentResponse,
                    forecastResponse: forecastResponse
                )

                let sections: [HomeSections] = [
                    HomeSections(
                        id: .carnet(city: model.city, current: model.current),
                        title: model.city,
                        subtitle: model.current.temperature,
                        description: model.current.conditionText,
                        additional: model.current.minMaxTemperature
                    ),
                    HomeSections(id: .hourly(items: model.hourly)),
                    HomeSections(id: .daily(items: model.daily))
                ]

                await MainActor.run {
                    Logger.log("\(model)", level: .debug)
                    viewInput?.showWeather(sections, colors: model.current.colors)
                }

            } catch {
                Logger.log("Loading sequence failed: \(error.localizedDescription)", level: .error)
                await MainActor.run {
                    viewInput?.showErrorAlert(title: "alert.error.title".localized, text: "alert.error.message".localized)
                }
            }

            await MainActor.run {
                self.isLoading = false
            }
        }
    }

}

extension HomePresenter: HomeViewOutput {

    func getWeather() {
        guard !isLoading else { return }
        isLoading = true

        DispatchQueue.main.async { [weak self] in
            self?.locationService.getLocation { result in
                guard let self else { return }
                switch result {
                case .success(let coordinates):
                    self.getWeather(for: coordinates)
                case .failure(let error):
                    self.getWeather(for: self.moscowsCoordinate)
                    if let locationError = error as? LocationError, locationError == .denied {
                        self.viewInput?.showSettingsAlert(
                            title: "alert.settings.title".localized,
                            text: "alert.settings.message".localized
                        )
                    } else {
                        Logger.log("Location error: \(error.localizedDescription)", level: .error)
                        self.viewInput?.showErrorAlert(title: "Error", text: "Something went wrong")
                    }
                }
            }
        }
    }
}
