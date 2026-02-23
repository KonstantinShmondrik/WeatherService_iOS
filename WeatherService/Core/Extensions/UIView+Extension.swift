//
//  UIView+Extension.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 22.02.2026.
//

import UIKit

extension UIView {

    static var reuseId: String { String(describing: self) }

    var screenInfo: ScreenInfo { ScreenInfo.current }

    var impactOccurred: Void { UIImpactFeedbackGenerator(style: .light).impactOccurred() }

    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach(self.addSubview)
    }

    func addSubviews(_ subviews: UIView...) {
        subviews.forEach(self.addSubview)
    }

    func gradientLocations(for colors: [UIColor]) -> [NSNumber] {
        guard colors.count > 1 else { return [0] }

        let step = 1.0 / Double(colors.count - 1)
        return (0..<colors.count).map { NSNumber(value: Double($0) * step) }
    }

    func applyGradient(
        colors: [UIColor],
        locations: [NSNumber]? = nil,
        startPoint: CGPoint = CGPoint(x: 0, y: 1),
        endPoint: CGPoint = CGPoint(x: 0, y: 0),
        cornerRadius: CGFloat = 0
    ) {
        layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.locations = locations
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.cornerRadius = cornerRadius
        gradientLayer.frame = bounds

        layer.insertSublayer(gradientLayer, at: 0)
    }

    func applyShadow(
        color: UIColor = .black,
        offset: CGSize = CGSize(width: -5.29, height: 18.5),
        radius: CGFloat = 19.82 / 2,
        opacity: Float = 0.09
    ) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
    }

    func removeShadow() {
        layer.shadowColor = nil
        layer.shadowOpacity = 0
        layer.shadowRadius = 0
        layer.shadowOffset = .zero
    }

    func removeBorder() {
        layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
    }

    func removeGradient() {
        layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
    }
}
