//
//  HomeViewInput.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 23.02.2026.
//


import UIKit

protocol HomeViewInput: AnyObject {

    func loading(_ isLoading: Bool)
    func showWeather(_ sections: [HomeSections], colors: [UIColor])
    func showErrorAlert(title: String, text: String)
    func showSettingsAlert(title: String, text: String)
}
