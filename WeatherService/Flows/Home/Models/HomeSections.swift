//
//  HomeSections.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 23.02.2026.
//

import UIKit

public struct HomeSections {

    enum Identifier: Equatable {

        case carnet(city: String, current: CurrentWeatherUIModel)
        case hourly(items: [HourlyWeatherUIModel])
        case daily(items: [DailyWeatherUIModel])

        private var key: String {
            switch self {
            case .carnet: return "carnet"
            case .hourly: return "hourly"
            case .daily: return "daily"
            }
        }

        static func == (lhs: HomeSections.Identifier, rhs: HomeSections.Identifier) -> Bool {
            return lhs.key == rhs.key
        }
    }

    var id: Identifier
    var title: String?
    var subtitle: String?
    var description: String?
    var additional: String?
    var icon: UIImage?
}
