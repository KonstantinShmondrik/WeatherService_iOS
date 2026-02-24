//
//  WeatherServiceTests.swift
//  WeatherServiceTests
//
//  Created by Константин Шмондрик on 24.02.2026.
//


import XCTest
@testable import Alamofire
@testable import WeatherService
import UIKit

@MainActor
final class WeatherServiceTests: XCTestCase {

    // MARK: - Mocks
    private final class HomeViewInputMock: HomeViewInput {
        var didShowWeather: Bool = false
        var didShowError: Bool = false
        var didShowSettings: Bool = false
        var lastSections: [HomeSections]?

        var showWeatherClosure: (([HomeSections], [UIColor]) -> Void)?
        var showSettingsClosure: (() -> Void)?
        var showErrorClosure: (() -> Void)?

        func loading(_ isLoading: Bool) {}

        func showWeather(_ sections: [HomeSections], colors: [UIColor]) {
            didShowWeather = true
            lastSections = sections
            showWeatherClosure?(sections, colors)
        }

        func showSettingsAlert(title: String, text: String) {
            didShowSettings = true
            showSettingsClosure?()
        }

        func showErrorAlert(title: String, text: String) {
            didShowError = true
            showErrorClosure?()
        }
    }

    private final class LocationServiceStub: LocationServiceProtocol {
        var result: Result<Coordinate, Error>?

        func getLocation(completion: @escaping (Result<Coordinate, Error>) -> Void) {
            if let result = result {
                completion(result)
            }
        }
    }

    private final class CurrentWeatherRequestFactoryMock: CurrentWeatherServiceProtocol {
        let response: WeatherResponse?
        init(response: WeatherResponse?) { self.response = response }

        func getCurrentWeather(
            for coordinate: Coordinate,
            completionHandler completion: @escaping (AFDataResponse<WeatherResponse>) -> Void
        ) {
            if let response = response {
                completion(.init(
                    request: nil,
                    response: nil,
                    data: nil,
                    metrics: nil,
                    serializationDuration: 0,
                    result: .success(response)
                ))
            } else {
                completion(.init(
                    request: nil,
                    response: nil,
                    data: nil,
                    metrics: nil,
                    serializationDuration: 0,
                    result: .failure(AFError.explicitlyCancelled)
                ))
            }
        }
    }

    private final class ForecastWeatherRequestFactoryMock: ForecastWeatherServiceProtocol {
        let response: WeatherResponse?
        init(response: WeatherResponse?) { self.response = response }

        func getForecastWeather(
            for coordinate: Coordinate,
            completionHandler completion: @escaping (AFDataResponse<WeatherResponse>) -> Void
        ) {
            if let response = response {
                completion(.init(
                    request: nil,
                    response: nil,
                    data: nil,
                    metrics: nil,
                    serializationDuration: 0,
                    result: .success(response)
                ))
            } else {
                completion(.init(
                    request: nil,
                    response: nil,
                    data: nil,
                    metrics: nil,
                    serializationDuration: 0,
                    result: .failure(AFError.explicitlyCancelled)
                ))
            }
        }
    }

    private final class RequestFactoryMock: RequestFactoryProtocol {
        let currentWeatherResponse: WeatherResponse?
        let forecastWeatherResponse: WeatherResponse?

        init(currentWeatherResponse: WeatherResponse?, forecastWeatherResponse: WeatherResponse?) {
            self.currentWeatherResponse = currentWeatherResponse
            self.forecastWeatherResponse = forecastWeatherResponse
        }

        func makeCurrentWeatherRequestFactory() -> CurrentWeatherServiceProtocol {
            CurrentWeatherRequestFactoryMock(response: currentWeatherResponse)
        }

        func makeForecastWeatherRequestFactory() -> ForecastWeatherServiceProtocol {
            ForecastWeatherRequestFactoryMock(response: forecastWeatherResponse)
        }
    }

    // MARK: - Tests
    func testGetWeather_success() {
        let expectation = self.expectation(description: "Weather loaded")

        let viewMock = HomeViewInputMock()
        let locationMock = LocationServiceStub()
        locationMock.result = .success(Coordinate(latitude: 55, longitude: 37))
        let stubWeather = WeatherResponse.stub()
        let requestFactoryMock = RequestFactoryMock(
            currentWeatherResponse: stubWeather,
            forecastWeatherResponse: stubWeather
        )

        let presenter = HomePresenter(
            requestFactory: requestFactoryMock,
            locationService: locationMock
        )
        presenter.viewInput = viewMock

        viewMock.showWeatherClosure = { _, _ in
            expectation.fulfill()
        }

        presenter.getWeather()

        wait(for: [expectation], timeout: 2.0)

        XCTAssertTrue(viewMock.didShowWeather)
        XCTAssertFalse(viewMock.didShowError)
        XCTAssertFalse(viewMock.didShowSettings)
        XCTAssertEqual(viewMock.lastSections?.count, 3)
    }

    func testGetWeather_locationDenied_showsSettings() {
        let expectation = self.expectation(description: "Settings alert shown")

        let viewMock = HomeViewInputMock()
        let locationMock = LocationServiceStub()
        locationMock.result = .failure(LocationError.denied)

        let presenter = HomePresenter(
            requestFactory: RequestFactoryMock(currentWeatherResponse: nil, forecastWeatherResponse: nil),
            locationService: locationMock
        )
        presenter.viewInput = viewMock

        viewMock.showSettingsClosure = {
            expectation.fulfill()
        }

        presenter.getWeather()

        wait(for: [expectation], timeout: 2.0)

        XCTAssertTrue(viewMock.didShowSettings)
        XCTAssertFalse(viewMock.didShowError)
        XCTAssertFalse(viewMock.didShowWeather)
    }

    func testGetWeather_locationFails_showsError() {
        let expectation = self.expectation(description: "Error alert shown")

        let viewMock = HomeViewInputMock()
        let locationMock = LocationServiceStub()
        locationMock.result = .failure(NSError(domain: "test", code: 1))

        let presenter = HomePresenter(
            requestFactory: RequestFactoryMock(currentWeatherResponse: nil, forecastWeatherResponse: nil),
            locationService: locationMock
        )
        presenter.viewInput = viewMock

        viewMock.showErrorClosure = {
            expectation.fulfill()
        }

        presenter.getWeather()

        wait(for: [expectation], timeout: 2.0)

        XCTAssertTrue(viewMock.didShowError)
        XCTAssertFalse(viewMock.didShowSettings)
        XCTAssertFalse(viewMock.didShowWeather)
    }
}
