//
//  CarnetViewCell.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 23.02.2026.
//


import UIKit

class CarnetViewCell: UICollectionViewCell {

    private let cityLabel = UILabel()
    private let temperatureLabel = UILabel()
    private let conditionLabel = UILabel()
    private let minMaxTemperatureLabel = UILabel()

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
        cityLabel.text = nil
        temperatureLabel.text = nil
        conditionLabel.text = nil
        minMaxTemperatureLabel.text = nil
    }

    private func addSubviews() {
        contentView.addSubviews(cityLabel, temperatureLabel, conditionLabel, minMaxTemperatureLabel)
    }

    private func setLayoutConstraints() {
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(22)
        }

        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(22)
        }

        conditionLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(22)
        }

        minMaxTemperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(conditionLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(22)
            make.bottom.equalToSuperview().offset(-16)
        }
    }

    private func stylize() {
        cityLabel.font = screenInfo.type == .large ? AppFont.Style.font_700_32 : AppFont.Style.font_700_30
        cityLabel.textColor = .white
        cityLabel.textAlignment = .center

        temperatureLabel.font = screenInfo.type == .large ? AppFont.Style.font_600_84 : AppFont.Style.font_600_82
        temperatureLabel.textColor = .white
        temperatureLabel.textAlignment = .center

        conditionLabel.font = screenInfo.type == .large ? AppFont.Style.font_600_24 : AppFont.Style.font_600_22
        conditionLabel.textColor = .white.withAlphaComponent(0.7)
        conditionLabel.textAlignment = .center

        minMaxTemperatureLabel.font = screenInfo.type == .large ? AppFont.Style.font_600_24 : AppFont.Style.font_600_22
        minMaxTemperatureLabel.textColor = .white
        minMaxTemperatureLabel.textAlignment = .center
    }

    private func setActions() {}

    var city: String? {
        get { cityLabel.text }
        set { cityLabel.text = newValue }
    }

    var temperature: String? {
        get { temperatureLabel.text }
        set { temperatureLabel.text = newValue }
    }

    var condition: String? {
        get { conditionLabel.text }
        set { conditionLabel.text = newValue }
    }

    var minMaxTemperature: String? {
        get { minMaxTemperatureLabel.text }
        set { minMaxTemperatureLabel.text = newValue }
    }
}
