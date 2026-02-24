//
//  UIColor+Extansion.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 22.02.2026.
//

import UIKit

extension UIColor {

    var hexStringWithAlpha: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgba = (
            Int(r * 255) << 24 |
            Int(g * 255) << 16 |
            Int(b * 255) << 8  |
            Int(a * 255)
        )
        return String(format: "#%08X", rgba)
    }

    convenience init?(hexWithAlpha: String) {
        let hex = hexWithAlpha
            .trimmingCharacters(in: CharacterSet(charactersIn: "#"))
            .uppercased()

        guard hex.count == 8, let hexValue = UInt32(hex, radix: 16) else {
            return nil
        }

        let r = CGFloat((hexValue & 0xFF000000) >> 24) / 255
        let g = CGFloat((hexValue & 0x00FF0000) >> 16) / 255
        let b = CGFloat((hexValue & 0x0000FF00) >> 8) / 255
        let a = CGFloat( hexValue & 0x000000FF       ) / 255

        self.init(red: r, green: g, blue: b, alpha: a)
    }

    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexSanitized.hasPrefix("#") { hexSanitized.removeFirst() }

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255
        let g = CGFloat((rgb & 0x00FF00) >> 8) / 255
        let b = CGFloat(rgb & 0x0000FF) / 255

        self.init(red: r, green: g, blue: b, alpha: 1)
    }
}
