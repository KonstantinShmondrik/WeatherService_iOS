//
//  WeatherResponse.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 22.02.2026.
//


import Foundation

// MARK: - WeatherResponse
struct WeatherResponse: Codable {

    let location: Location?
    let current: Current?
    let forecast: Forecast?
}

// MARK: - Location
struct Location: Codable {

    let name: String?
    let region: String?
    let country: String?
    let lat: Double?
    let lon: Double?
    let tzID: String?
    let localtimeEpoch: Int?
    let localtime: String?

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon, localtime
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
    }
}

// MARK: - Current
struct Current: Codable {

    let lastUpdatedEpoch: Int?
    let lastUpdated: String?

    let tempC: Double?
    let tempF: Double?
    let isDay: Int?

    let condition: Condition?

    let windMph: Double?
    let windKph: Double?
    let windDegree: Int?
    let windDir: String?

    let pressureMB: Int?
    let pressureIn: Double?

    let precipMm: Double?
    let precipIn: Double?

    let humidity: Int?
    let cloud: Int?

    let feelslikeC: Double?
    let feelslikeF: Double?

    let windchillC: Double?
    let windchillF: Double?

    let heatindexC: Double?
    let heatindexF: Double?

    let dewpointC: Double?
    let dewpointF: Double?

    let visKM: Double?
    let visMiles: Double?

    let uv: Double?

    let gustMph: Double?
    let gustKph: Double?

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity
        case cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
    }
}

// MARK: - Condition
struct Condition: Codable {

    let text: String?
    let icon: String?
    let code: Int?
}

// MARK: - Forecast
struct Forecast: Codable {
    let forecastday: [ForecastDay]?
}

// MARK: - ForecastDay
struct ForecastDay: Codable {
    let date: String?
    let dateEpoch: Int?
    let day: Day?
    let astro: Astro?
    let hour: [Hour]?

    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day
        case astro
        case hour
    }
}

// MARK: - Day
struct Day: Codable {
    let maxtempC: Double?
    let maxtempF: Double?
    let mintempC: Double?
    let mintempF: Double?
    let avgtempC: Double?
    let avgtempF: Double?

    let maxwindMph: Double?
    let maxwindKph: Double?

    let totalprecipMm: Double?
    let totalprecipIn: Double?
    let totalsnowCM: Double?

    let avgvisKM: Double?
    let avgvisMiles: Double?

    let avghumidity: Int?
    let dailyWillItRain: Int?
    let dailyChanceOfRain: Int?
    let dailyWillItSnow: Int?
    let dailyChanceOfSnow: Int?

    let condition: Condition?
    let uv: Double?

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case avgtempC = "avgtemp_c"
        case avgtempF = "avgtemp_f"
        case maxwindMph = "maxwind_mph"
        case maxwindKph = "maxwind_kph"
        case totalprecipMm = "totalprecip_mm"
        case totalprecipIn = "totalprecip_in"
        case totalsnowCM = "totalsnow_cm"
        case avgvisKM = "avgvis_km"
        case avgvisMiles = "avgvis_miles"
        case avghumidity
        case dailyWillItRain = "daily_will_it_rain"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case dailyWillItSnow = "daily_will_it_snow"
        case dailyChanceOfSnow = "daily_chance_of_snow"
        case condition
        case uv
    }
}

// MARK: - Astro
struct Astro: Codable {

    let sunrise: String?
    let sunset: String?
    let moonrise: String?
    let moonset: String?
    let moonPhase: String?
    let moonIllumination: Int?
    let isMoonUp: Int?
    let isSunUp: Int?

    enum CodingKeys: String, CodingKey {
        case sunrise
        case sunset
        case moonrise
        case moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
        case isMoonUp = "is_moon_up"
        case isSunUp = "is_sun_up"
    }
}

// MARK: - Hour
struct Hour: Codable {

    let timeEpoch: Int?
    let time: String?

    let tempC: Double?
    let tempF: Double?
    let isDay: Int?

    let condition: Condition?

    let windMph: Double?
    let windKph: Double?
    let windDegree: Int?
    let windDir: String?

    let pressureMB: Int?
    let pressureIn: Double?

    let precipMm: Double?
    let precipIn: Double?

    let humidity: Int?
    let cloud: Int?

    let feelslikeC: Double?
    let feelslikeF: Double?

    let windchillC: Double?
    let windchillF: Double?

    let heatindexC: Double?
    let heatindexF: Double?

    let dewpointC: Double?
    let dewpointF: Double?

    let willItRain: Int?
    let chanceOfRain: Int?
    let willItSnow: Int?
    let chanceOfSnow: Int?

    let visKM: Double?
    let visMiles: Double?

    let gustMph: Double?
    let gustKph: Double?

    let uv: Double?

    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity
        case cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case willItRain = "will_it_rain"
        case chanceOfRain = "chance_of_rain"
        case willItSnow = "will_it_snow"
        case chanceOfSnow = "chance_of_snow"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case uv
    }
}
