//
//  AppFont.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 22.02.2026.
//


import UIKit

struct AppFont {

    enum Style {
        /// 12, 400
        static let font_400_12 = SFProFont(ofSize: 12, weight: .regular)
        /// 14, 400
        static let font_400_14 = SFProFont(ofSize: 14, weight: .regular)
        /// 13, 400
        static let font_400_13 = SFProFont(ofSize: 13, weight: .regular)
        /// 15, 400
        static let font_400_15 = SFProFont(ofSize: 15, weight: .regular)
        /// 16, 400
        static let font_400_16 = SFProFont(ofSize: 16, weight: .regular)
        /// 18, 400
        static let font_400_18 = SFProFont(ofSize: 18, weight: .regular)
        /// 20, 400
        static let font_400_20 = SFProFont(ofSize: 20, weight: .regular)
        /// 22, 400
        static let font_400_22 = SFProFont(ofSize: 22, weight: .regular)
        /// 40, 400
        static let font_400_40 = SFProFont(ofSize: 40, weight: .regular)
        /// 42, 400
        static let font_400_42 = SFProFont(ofSize: 42, weight: .regular)
        /// 74, 400
        static let font_400_74 = SFProFont(ofSize: 74, weight: .regular)

        /// 12, 500
        static let font_500_12 = SFProFont(ofSize: 12, weight: .medium)
        /// 14, 500
        static let font_500_14 = SFProFont(ofSize: 14, weight: .medium)
        /// 16, 500
        static let font_500_16 = SFProFont(ofSize: 16, weight: .medium)
        /// 18, 500
        static let font_500_18 = SFProFont(ofSize: 18, weight: .medium)
        /// 20, 500
        static let font_500_20 = SFProFont(ofSize: 20, weight: .medium)
        /// 22, 500
        static let font_500_22 = SFProFont(ofSize: 22, weight: .medium)
        /// 24, 500
        static let font_500_24 = SFProFont(ofSize: 24, weight: .medium)
        /// 28, 500
        static let font_500_28 = SFProFont(ofSize: 28, weight: .medium)
        /// 30, 500
        static let font_500_30 = SFProFont(ofSize: 30, weight: .medium)
        /// 36, 500
        static let font_500_36 = SFProFont(ofSize: 36, weight: .medium)
        /// 37, 500
        static let font_500_37 = SFProFont(ofSize: 37, weight: .medium)
        /// 38, 500
        static let font_500_38 = SFProFont(ofSize: 38, weight: .medium)
        /// 40, 500
        static let font_500_40 = SFProFont(ofSize: 40, weight: .medium)
        /// 42, 500
        static let font_500_42 = SFProFont(ofSize: 42, weight: .medium)
        /// 44, 500
        static let font_500_44 = SFProFont(ofSize: 44, weight: .medium)
        /// 60, 500
        static let font_500_60 = SFProFont(ofSize: 60, weight: .medium)
        /// 64, 500
        static let font_500_64 = SFProFont(ofSize: 64, weight: .medium)

        /// 14, 600
        static let font_600_14 = SFProFont(ofSize: 14, weight: .semibold)
        /// 16, 600
        static let font_600_16 = SFProFont(ofSize: 16, weight: .semibold)
        /// 18, 600
        static let font_600_18 = SFProFont(ofSize: 18, weight: .semibold)
        /// 20, 600
        static let font_600_20 = SFProFont(ofSize: 20, weight: .semibold)
        /// 22, 600
        static let font_600_22 = SFProFont(ofSize: 22, weight: .semibold)
        /// 24, 600
        static let font_600_24 = SFProFont(ofSize: 24, weight: .semibold)
        /// 26, 600
        static let font_600_26 = SFProFont(ofSize: 26, weight: .semibold)
        /// 28, 600
        static let font_600_28 = SFProFont(ofSize: 28, weight: .semibold)
        /// 30, 600
        static let font_600_30 = SFProFont(ofSize: 30, weight: .semibold)
        /// 32, 600
        static let font_600_32 = SFProFont(ofSize: 32, weight: .semibold)
        /// 34, 600
        static let font_600_34 = SFProFont(ofSize: 34, weight: .semibold)
        /// 40, 600
        static let font_600_40 = SFProFont(ofSize: 40, weight: .semibold)
        /// 44, 600
        static let font_600_44 = SFProFont(ofSize: 44, weight: .semibold)
        /// 72, 600
        static let font_600_82 = SFProFont(ofSize: 82, weight: .semibold)
        /// 74, 600
        static let font_600_84 = SFProFont(ofSize: 84, weight: .semibold)

        /// 13, 700
        static let font_700_13 = SFProFont(ofSize: 13, weight: .bold)
        /// 15, 700
        static let font_700_15 = SFProFont(ofSize: 15, weight: .bold)
        /// 16, 700
        static let font_700_16 = SFProFont(ofSize: 16, weight: .bold)
        /// 18, 700
        static let font_700_18 = SFProFont(ofSize: 18, weight: .bold)
        /// 20, 700
        static let font_700_20 = SFProFont(ofSize: 20, weight: .bold)
        /// 22, 700
        static let font_700_22 = SFProFont(ofSize: 22, weight: .bold)
        /// 24, 700
        static let font_700_24 = SFProFont(ofSize: 24, weight: .bold)
        /// 28, 700
        static let font_700_28 = SFProFont(ofSize: 28, weight: .bold)
        /// 30, 700
        static let font_700_30 = SFProFont(ofSize: 30, weight: .bold)
        /// 32, 700
        static let font_700_32 = SFProFont(ofSize: 32, weight: .bold)
        /// 44, 700
        static let font_700_44 = SFProFont(ofSize: 44, weight: .bold)
    }

    static func SFProFont(ofSize size: CGFloat = UIFont.systemFontSize, weight: UIFont.Weight = .regular) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
}
