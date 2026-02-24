//
//  WeatherType.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 22.02.2026.
//

import Foundation

enum WeatherType {

    case clear
    case cloudy
    case rain(intensity: Intensity)
    case snow(intensity: Intensity)
    case thunder
    case fog
    case unknown
}

enum Intensity {

    case light
    case moderate
    case heavy
}
