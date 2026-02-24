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

    func colorized(phrases: [String: UIColor]) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)

        for (phrase, color) in phrases {
            var searchRange = self.startIndex..<self.endIndex

            while let range = self.range(of: phrase, options: .caseInsensitive, range: searchRange) {
                let nsRange = NSRange(range, in: self)
                attributedString.addAttribute(.foregroundColor, value: color, range: nsRange)

                searchRange = range.upperBound..<self.endIndex
            }
        }

        return attributedString
    }
}
