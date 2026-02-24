//
//  HomeBuilder.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 23.02.2026.
//


import UIKit

class HomeBuilder {

    static func build() -> (UIViewController & HomeViewInput) {
        let presenter = HomePresenter(requestFactory: RequestFactory(), locationService: LocationService())
        let viewController = HomeViewController(presenter: presenter)

        presenter.viewInput = viewController
        return viewController
    }
}
