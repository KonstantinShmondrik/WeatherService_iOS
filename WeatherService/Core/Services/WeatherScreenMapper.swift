//
//  WeatherScreenMapper.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 22.02.2026.
//


import Foundation

struct WeatherScreenMapper {

    static func map(currentResponse: WeatherResponse, forecastResponse: WeatherResponse) -> WeatherScreenModel {
        let city = currentResponse.location?.name ?? "—"

        let current = mapCurrent(
            current: currentResponse.current,
            forecast: forecastResponse.forecast?.forecastday?.first
        )

        let hourly = mapHourly(
            forecastDays: forecastResponse.forecast?.forecastday,
            currentEpoch: currentResponse.location?.localtimeEpoch
        )

        let daily = mapDaily(
            forecastDays: forecastResponse.forecast?.forecastday
        )

        return WeatherScreenModel(
            city: city,
            current: current,
            hourly: hourly,
            daily: daily
        )
    }
}

private extension WeatherScreenMapper {

    static func mapCurrent(current: Current?, forecast: ForecastDay?) -> CurrentWeatherUIModel {
        let temp = Int(current?.tempC ?? 0)
        let feels = Int(current?.feelslikeC ?? 0)

        let maxTemp = Int(forecast?.day?.maxtempC ?? 0)
        let minTemp = Int(forecast?.day?.mintempC ?? 0)

        let iconPath = current?.condition?.icon
        let iconURL = iconPath.flatMap {
            URL(string: "https:\($0)")
        }

        return CurrentWeatherUIModel(
            temperature: "\(temp)°",
            conditionText: current?.condition?.text ?? "",
            conditionIconURL: iconURL,
            minMaxTemperature: "H: \(maxTemp)°  L: \(minTemp)°",
            isDay: current?.isDay == 1,
            conditionCode: current?.condition?.code ?? 0,
            feelsLike: "Feels like \(feels)°",
            humidity: "Humidity \(current?.humidity ?? 0)%",
            wind: "Wind \(Int(current?.windKph ?? 0)) km/h"
        )
    }
}

private extension WeatherScreenMapper {

    static func mapHourly(forecastDays: [ForecastDay]?, currentEpoch: Int?) -> [HourlyWeatherUIModel] {
        guard let forecastDays,
              forecastDays.count >= 2 else { return [] }

        let now = currentEpoch ?? 0

        var result: [Hour] = []

        if let todayHours = forecastDays[0].hour {
            let filtered = todayHours.filter { ($0.timeEpoch ?? 0) >= now }
            result.append(contentsOf: filtered)
        }

        if let tomorrowHours = forecastDays[1].hour {
            result.append(contentsOf: tomorrowHours)
        }

        return result.map { hour in
            let temp = Int(hour.tempC ?? 0)

            let iconURL = hour.condition?.icon.flatMap {
                URL(string: "https:\($0)")
            }

            let timeString = hour.time?
                .components(separatedBy: " ")
                .last ?? "--:--"

            return HourlyWeatherUIModel(
                isDay: hour.isDay == 1,
                time: timeString,
                temperature: "\(temp)°",
                iconURL: iconURL,
                isNow: (hour.timeEpoch == now)
            )
        }
    }
}

private extension WeatherScreenMapper {

    static func mapDaily(forecastDays: [ForecastDay]?) -> [DailyWeatherUIModel] {
        guard let forecastDays else { return [] }

        return forecastDays.prefix(3).map { day in

            let max = Int(day.day?.maxtempC ?? 0)
            let min = Int(day.day?.mintempC ?? 0)

            let iconURL = day.day?.condition?.icon.flatMap {
                URL(string: "https:\($0)")
            }

            let title = formatDay(from: day.date)

            return DailyWeatherUIModel(
                dayTitle: title,
                iconURL: iconURL,
                minTemperature: "\(min)°",
                maxTemperature: "\(max)°"
            )
        }
    }

    static func formatDay(from dateString: String?) -> String {
        guard let dateString else { return "" }

        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "yyyy-MM-dd"

        guard let date = formatter.date(from: dateString) else { return "" }

        if Calendar.current.isDateInToday(date) {
            return "Today"
        }

        formatter.dateFormat = "E"
        return formatter.string(from: date)
    }
}
