//
//  ScreenType.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 22.02.2026.
//


import UIKit

enum ScreenType {

    case small
    case medium
    case large
}

struct ScreenInfo {

    let size: CGSize
    let scale: CGFloat
    let safeAreaInsets: UIEdgeInsets
    let type: ScreenType

    var isNotchScreen: Bool {
        return safeAreaInsets.top > 20
    }

    var isDynamicIsland: Bool {
        return safeAreaInsets.top >= 54
    }

    var isCompactWidth: Bool {
        return size.width <= 375
    }

    var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }

    static var current: ScreenInfo {
        let screenSize = UIScreen.main.bounds.size
        let height = max(screenSize.width, screenSize.height)
        let scale = UIScreen.main.scale

        let type: ScreenType
        if height <= 667 {
            type = .small
        } else if height <= 925 {
            type = .medium
        } else {
            type = .large
        }

        let window = UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .first

        let insets = window?.safeAreaInsets ?? .zero

        return ScreenInfo(size: screenSize, scale: scale, safeAreaInsets: insets, type: type)
    }
}