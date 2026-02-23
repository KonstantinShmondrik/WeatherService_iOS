//
//  WeatherTypeMapper.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 22.02.2026.
//


struct WeatherTypeMapper {

    static func map(code: Int) -> WeatherType {
        guard let entry = weatherMap[code] else {
            return .unknown
        }
        return entry
    }

    private static let weatherMap: [Int: WeatherType] = [

        // Clear
        1000: .clear,

        // Cloudy
        1003: .cloudy,
        1006: .cloudy,
        1009: .cloudy,

        // Fog
        1030: .fog,
        1135: .fog,
        1147: .fog,

        // Thunder
        1087: .thunder,
        1273: .thunder,
        1276: .thunder,
        1279: .thunder,
        1282: .thunder,

        // Rain - light
        1063: .rain(intensity: .light),
        1150: .rain(intensity: .light),
        1153: .rain(intensity: .light),
        1180: .rain(intensity: .light),
        1183: .rain(intensity: .light),
        1198: .rain(intensity: .light),
        1204: .rain(intensity: .light),
        1240: .rain(intensity: .light),
        1249: .rain(intensity: .light),

        // Rain - moderate
        1186: .rain(intensity: .moderate),
        1189: .rain(intensity: .moderate),
        1201: .rain(intensity: .moderate),
        1243: .rain(intensity: .moderate),
        1252: .rain(intensity: .moderate),

        // Rain - heavy
        1192: .rain(intensity: .heavy),
        1195: .rain(intensity: .heavy),
        1246: .rain(intensity: .heavy),

        // Snow - light
        1066: .snow(intensity: .light),
        1210: .snow(intensity: .light),
        1213: .snow(intensity: .light),
        1255: .snow(intensity: .light),

        // Snow - moderate
        1216: .snow(intensity: .moderate),
        1219: .snow(intensity: .moderate),

        // Snow - heavy
        1114: .snow(intensity: .heavy),
        1117: .snow(intensity: .heavy),
        1222: .snow(intensity: .heavy),
        1225: .snow(intensity: .heavy),
        1258: .snow(intensity: .heavy)
    ]
}
