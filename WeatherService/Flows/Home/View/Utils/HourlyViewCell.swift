//
//  HourlyViewCell.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 24.02.2026.
//

import UIKit

class HourlyViewCell: UICollectionViewCell {

    private let timeLabel = UILabel()
    private let temperatureLabel = UILabel()
    private let iconImageView = UIImageView()

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
        timeLabel.text = nil
        temperatureLabel.text = nil
        iconImageView.image = nil
    }

    private func addSubviews() {
        contentView.addSubviews(timeLabel, temperatureLabel, iconImageView)
    }

    private func setLayoutConstraints() {
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.leading.trailing.equalToSuperview().inset(4)
        }

        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(4)
            make.height.width.equalTo(screenInfo.type == .large ? 48 : 40)
            make.centerX.equalToSuperview()
        }

        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(4)
            make.bottom.equalToSuperview().offset(-2)
        }
    }

    private func stylize() {
        timeLabel.font = screenInfo.type == .large ? AppFont.Style.font_500_16 : AppFont.Style.font_500_14
        timeLabel.textColor = .white
        timeLabel.textAlignment = .center

        temperatureLabel.font = screenInfo.type == .large ? AppFont.Style.font_500_16 : AppFont.Style.font_500_14
        temperatureLabel.textColor = .white
        temperatureLabel.textAlignment = .center

        iconImageView.contentMode = .scaleAspectFill
    }

    private func setActions() {}

    func configure(with urlString: String) {

        iconImageView.image = nil

        ImageLoader.shared.loadImage(from: urlString) { [weak self] image in
            self?.iconImageView.image = image
        }
    }

    var time: String? {
        get { timeLabel.text }
        set { timeLabel.text = newValue }
    }

    var temperature: String? {
        get { temperatureLabel.text }
        set { temperatureLabel.text = newValue }
    }
}
