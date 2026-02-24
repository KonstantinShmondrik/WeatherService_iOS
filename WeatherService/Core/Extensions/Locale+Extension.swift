//
//  Locale+Extension.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 22.02.2026.
//

import Foundation

extension Locale {

    static var preferredLanguage: String {
        let language = Locale.preferredLanguages.first ?? "en"
        return language
    }
}
