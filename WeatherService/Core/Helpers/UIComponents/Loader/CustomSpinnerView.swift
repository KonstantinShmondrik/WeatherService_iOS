//
//  CustomSpinnerView.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 23.02.2026.
//


import UIKit

class CustomSpinnerView: UIView {

    private let replicatorLayer = CAReplicatorLayer()
    private let dot = CALayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSpinner()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSpinner()
    }

    private func setupSpinner() {
        let dotWidth: CGFloat = bounds.width * 0.08
        let dotHeight: CGFloat = bounds.height * 0.25

        dot.frame = CGRect(
            x: bounds.midX - dotWidth / 2,
            y: 0,
            width: dotWidth,
            height: dotHeight
        )
        dot.backgroundColor = UIColor.white.cgColor
        dot.cornerRadius = dotWidth / 2

        replicatorLayer.frame = bounds
        replicatorLayer.addSublayer(dot)
        layer.addSublayer(replicatorLayer)

        let instanceCount = 14
        replicatorLayer.instanceCount = instanceCount
        let angle = (2 * CGFloat.pi) / CGFloat(instanceCount)
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1)

        replicatorLayer.instanceAlphaOffset = -1.0 / Float(instanceCount)

        startAnimating()
    }

    func startAnimating() {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = 0
        animation.toValue = 2 * CGFloat.pi
        animation.duration = 2.0
        animation.repeatCount = .infinity
        layer.add(animation, forKey: "rotation")
    }

    func stopAnimating() {
        layer.removeAnimation(forKey: "rotation")
    }
}
