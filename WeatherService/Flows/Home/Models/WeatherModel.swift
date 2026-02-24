//
//  WeatherModel.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 22.02.2026.
//


import UIKit

// MARK: - Root Screen Model
struct WeatherScreenModel {

    let city: String
    let current: CurrentWeatherUIModel
    let hourly: [HourlyWeatherUIModel]
    let daily: [DailyWeatherUIModel]
}

struct CurrentWeatherUIModel {

    let temperature: String          // "18°"
    let conditionText: String        // "Cloudy"
    let conditionIconURL: String?
    let minMaxTemperature: String    // "H: 21°  L: 12°"
    let isDay: Bool
    let conditionCode: Int

    let feelsLike: String            // "Feels like 17°"
    let humidity: String             // "Humidity 65%"
    let wind: String                 // "Wind 12 km/h"

    var weatherType: WeatherType {
        WeatherTypeMapper.map(code: conditionCode)
    }

    var colors: [UIColor] {
        switch weatherType {

        case .clear:
            return isDay
            ? [UIColor(hex: "#4FACFE"), UIColor(hex: "#00C6FB"), UIColor(hex: "#005BEA")]
            : [UIColor(hex: "#0F2027"), UIColor(hex: "#203A43"), UIColor(hex: "#2C5364")]

        case .cloudy:
            return isDay
            ? [UIColor(hex: "#D7DDE8"), UIColor(hex: "#A7B7C7"), UIColor(hex: "#6E7F91")]
            : [UIColor(hex: "#232526"), UIColor(hex: "#3A3F44"), UIColor(hex: "#414345")]

        case .fog:
            return isDay
            ? [UIColor(hex: "#BDC3C7"), UIColor(hex: "#D7DDE8"), UIColor(hex: "#ECE9E6")]
            : [UIColor(hex: "#3E5151"), UIColor(hex: "#2C3E50"), UIColor(hex: "#1F1F1F")]

        case .thunder:
            return isDay
            ? [UIColor(hex: "#373B44"), UIColor(hex: "#2C3E50"), UIColor(hex: "#4286f4")]
            : [UIColor(hex: "#0F0C29"), UIColor(hex: "#302B63"), UIColor(hex: "#1F1C2C")]

        case .rain(let intensity):
            return rainGradient(for: intensity)

        case .snow(let intensity):
            return snowGradient(for: intensity)

        case .unknown:
            return isDay
            ? [UIColor(hex: "#4FACFE"), UIColor(hex: "#00C6FB")]
            : [UIColor(hex: "#141E30"), UIColor(hex: "#243B55")]
        }
    }

    private func rainGradient(for intensity: Intensity) -> [UIColor] {
        switch intensity {
        case .light:
            return isDay
            ? [UIColor(hex: "#5D9CEC"), UIColor(hex: "#4A89DC")]
            : [UIColor(hex: "#1F3A5F"), UIColor(hex: "#162447")]

        case .moderate:
            return isDay
            ? [UIColor(hex: "#355C7D"), UIColor(hex: "#2C3E50"), UIColor(hex: "#1B263B")]
            : [UIColor(hex: "#141E30"), UIColor(hex: "#243B55"), UIColor(hex: "#0F2027")]

        case .heavy:
            return isDay
            ? [UIColor(hex: "#232526"), UIColor(hex: "#1C1C1C")]
            : [UIColor(hex: "#000000"), UIColor(hex: "#0F2027")]
        }
    }

    private func snowGradient(for intensity: Intensity) -> [UIColor] {
        switch intensity {
        case .light:
            return [UIColor(hex: "#E6DADA"),
                    UIColor(hex: "#C9D6FF")]

        case .moderate:
            return [UIColor(hex: "#A8C0FF"),
                    UIColor(hex: "#6A85B6")]

        case .heavy:
            return [UIColor(hex: "#1E3C72"),
                    UIColor(hex: "#2A5298"),
                    UIColor(hex: "#16222A")]
        }
    }
}

struct HourlyWeatherUIModel {

    let isDay: Bool
    let time: String                 // "15:00"
    let temperature: String          // "17°"
    let iconURL: String?
    let isNow: Bool                  // для выделения текущего часа
}

struct DailyWeatherUIModel {

    let dayTitle: String             // "Mon"
    let iconURL: String?
    let minTemperature: String       // "12°"
    let maxTemperature: String       // "21°"
}
