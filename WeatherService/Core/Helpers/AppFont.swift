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
        /// 50, 600
        static let font_600_50 = SFProFont(ofSize: 50, weight: .semibold)

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

    struct Typography {

        static var headlineLarge: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_600_44
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_600_34 : AppFont.Style.font_600_32
            }
        }

        static var headlineMedium: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_600_44
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_600_26 : AppFont.Style.font_600_24
            }
        }

        static var headlineMedium_2: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_600_50
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_600_26 : AppFont.Style.font_600_24
            }
        }

        static var headlineSmall: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_500_28
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_500_22  : AppFont.Style.font_500_20
            }
        }

        static var headlineLarge_3: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_500_60
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_500_30  : AppFont.Style.font_500_28
            }
        }

        // MARK: - Body Text
        static var textLargeSB: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_600_44
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_600_30 : AppFont.Style.font_600_28
            }
        }

        static var textTabBar: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_400_22
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_400_20 : AppFont.Style.font_400_18
            }
        }

        static var textMediumSM: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_600_22
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_600_18 : AppFont.Style.font_600_16
            }
        }

        static var textMediumSM_2: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_600_28
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_600_18 : AppFont.Style.font_600_16
            }
        }

        static var textMediumSM_3: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_600_26
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_600_22 : AppFont.Style.font_600_20
            }
        }

        static var textMediumSM_5: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_600_40
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_600_20 : AppFont.Style.font_600_18
            }
        }

        static var textMediumSM_4: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_600_28
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_600_16 : AppFont.Style.font_600_14
            }
        }

        static var textMediumSM_6: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_600_22
            } else {
                switch ScreenInfo.current.type {
                case .large: return AppFont.Style.font_600_18
                case .medium: return AppFont.Style.font_600_16
                case.small: return AppFont.Style.font_600_14
                }
            }
        }

        static var textMediumR: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_400_22
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_400_18 : AppFont.Style.font_400_16
            }
        }

        static var textSmallR_2: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_400_18
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_400_14 : AppFont.Style.font_400_12
            }
        }

        static var textSmallR_3: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_400_22
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_400_15 : AppFont.Style.font_400_13
            }
        }

        static var textSmallM: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_500_22
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_500_16 : AppFont.Style.font_500_14
            }
        }

        static var textSmallM_2: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_500_18
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_500_16 : AppFont.Style.font_500_14
            }
        }

        static var textSmallM_3: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_500_24
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_500_16 : AppFont.Style.font_500_14
            }
        }

        static var textMediumM: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_500_22
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_500_18 : AppFont.Style.font_500_16
            }
        }

        static var textLargeM: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_500_40
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_500_20 : AppFont.Style.font_500_18
            }
        }

        static var textLargeM_2: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_500_37
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_500_22 : AppFont.Style.font_500_20
            }
        }

        static var textLargeM_3: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_500_36
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_500_24 : AppFont.Style.font_500_22
            }
        }

        static var textSmallR: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_400_22
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_400_16 : AppFont.Style.font_400_14
            }
        }

        static var textExtraLargeR: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_400_74
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_400_42 : AppFont.Style.font_400_40
            }
        }

        static var textSmallR2: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_400_18
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_400_16 : AppFont.Style.font_400_14
            }
        }

        static var textExtraSmallM: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_400_16
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_500_14 : AppFont.Style.font_500_12
            }
        }

        static var textSmallB: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_700_18
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_700_15 : AppFont.Style.font_700_13
            }
        }

        static var textMediumB: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_700_22
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_700_18 : AppFont.Style.font_700_16
            }
        }

        static var textLargeB: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_700_44
            } else {
                switch ScreenInfo.current.type {
                case .large: return AppFont.Style.font_700_24
                case  .medium: return  AppFont.Style.font_700_22
                case .small: return  AppFont.Style.font_700_20
                }
            }
        }

        static var textLargeB_2: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_700_44
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_700_30 : AppFont.Style.font_700_28
            }
        }

        static var textLargeB_3: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_700_32
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_700_22 : AppFont.Style.font_700_20
            }
        }

        // MARK: - Button Text
        static var buttonLarge: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_600_22
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_600_18 : AppFont.Style.font_600_16
            }
        }

        static var buttonSmall: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_400_18
            } else {
                return ScreenInfo.current.type == .large ? AppFont.Style.font_400_15 : AppFont.Style.font_400_13
            }
        }

        // MARK: - Number
        static var numberLarge: UIFont {
            if ScreenInfo.current.isPad {
                return AppFont.Style.font_500_64
            } else {
                switch ScreenInfo.current.type {
                case .large: return AppFont.Style.font_500_44
                case .medium: return AppFont.Style.font_500_42
                case .small: return AppFont.Style.font_500_38
                }
            }
        }
    }

    static func SFProFont(ofSize size: CGFloat = UIFont.systemFontSize, weight: UIFont.Weight = .regular) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
}