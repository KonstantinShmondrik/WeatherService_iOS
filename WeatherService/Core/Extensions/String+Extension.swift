//
//  String+Extension.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 23.02.2026.
//

import UIKit

extension String {

    var localized: String {
        let language = Locale.preferredLanguage

        guard let path = Bundle.main.path(forResource: language, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            return NSLocalizedString(self, comment: "")
        }
        return NSLocalizedString(self, tableName: nil, bundle: bundle, comment: "")
    }
}
