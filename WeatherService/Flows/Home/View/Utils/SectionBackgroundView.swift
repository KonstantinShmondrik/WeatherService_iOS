//
//  SectionBackgroundView.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 24.02.2026.
//

import UIKit

final class SectionBackgroundView: UICollectionReusableView {

    static let elementKind = "section-background-element-kind"

    override init(frame: CGRect) {
        super.init(frame: frame)

        addGlassEffect(cornerRadius: 16, blurAlpha: 0.98)
        layer.cornerRadius = 16
        layer.masksToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
