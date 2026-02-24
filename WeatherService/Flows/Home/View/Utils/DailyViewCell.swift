//
//  DailyViewCell.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 24.02.2026.
//

import UIKit

class DailyViewCell: UICollectionViewCell {

    private let titleLabel = UILabel()
    private let minMaxTemperatureLabel = UILabel()
    private let iconImageView = UIImageView()
    private let separatorView = UIView()

    var isSeparatorHidden: Bool = false {
        didSet { separatorView.isHidden = isSeparatorHidden }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews()
        setLayoutConstraints()
        stylize()
        setActions()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        minMaxTemperatureLabel.text = nil
        iconImageView.image = nil
    }

    private func addSubviews() {
        contentView.addSubviews(titleLabel, minMaxTemperatureLabel, iconImageView, separatorView)
    }

    private func setLayoutConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
        }

        iconImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(screenInfo.type == .large ? 52 : 48)
        }

        minMaxTemperatureLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
        }

        separatorView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(1)
        }
    }

    private func stylize() {
        titleLabel.font = screenInfo.type == .large ? AppFont.Style.font_500_22 : AppFont.Style.font_500_20
        titleLabel.textColor = .white

        iconImageView.contentMode = .scaleAspectFill

        separatorView.backgroundColor = .systemGray
    }

    private func setActions() {}

    private func setTemperatureLabel(_ text: String, phrases: [String : UIColor]) {
        minMaxTemperatureLabel.text = text
        minMaxTemperatureLabel.textColor = .white
        minMaxTemperatureLabel.attributedText = minMaxTemperatureLabel.text?.colorized(phrases: phrases)
        minMaxTemperatureLabel.font = screenInfo.type == .large ? AppFont.Style.font_500_22 : AppFont.Style.font_500_20
        minMaxTemperatureLabel.textAlignment = .right
        minMaxTemperatureLabel.numberOfLines = 0
    }

    func configure(with urlString: String) {
        iconImageView.image = nil

        ImageLoader.shared.loadImage(from: urlString) { [weak self] image in
            self?.iconImageView.image = image
        }
    }

    func configure(minTemperature: String, maxTemperature: String) {
        setTemperatureLabel(
            "\(minTemperature) / \(maxTemperature)",
            phrases: ["\(minTemperature)" : .white.withAlphaComponent(0.7)]
        )
    }
    
    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
}
