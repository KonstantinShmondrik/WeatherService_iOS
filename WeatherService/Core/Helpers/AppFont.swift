//
//  AppFont.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 22.02.2026.
//


import UIKit

struct AppFont {

    enum Style {
        /// 14, 500
        static let font_500_14 = SFProFont(ofSize: 14, weight: .medium)
        /// 16, 500
        static let font_500_16 = SFProFont(ofSize: 16, weight: .medium)
        /// 20, 500
        static let font_500_20 = SFProFont(ofSize: 20, weight: .medium)
        /// 22, 500
        static let font_500_22 = SFProFont(ofSize: 22, weight: .medium)

        /// 22, 600
        static let font_600_22 = SFProFont(ofSize: 22, weight: .semibold)
        /// 24, 600
        static let font_600_24 = SFProFont(ofSize: 24, weight: .semibold)
        /// 82, 600
        static let font_600_82 = SFProFont(ofSize: 82, weight: .semibold)
        /// 84, 600
        static let font_600_84 = SFProFont(ofSize: 84, weight: .semibold)

        /// 30, 700
        static let font_700_30 = SFProFont(ofSize: 30, weight: .bold)
        /// 32, 700
        static let font_700_32 = SFProFont(ofSize: 32, weight: .bold)
    }

    static func SFProFont(ofSize size: CGFloat = UIFont.systemFontSize, weight: UIFont.Weight = .regular) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
}
