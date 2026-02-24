//
//  LoadingView.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 23.02.2026.
//


import UIKit

class LoadingView: UIView {

    private let containerView = UIView()
    private let activityIndicatorView = CustomSpinnerView(frame: CGRect(x: 0, y: 0, width: 73, height: 73))
    private let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(containerView)
        containerView.addSubviews(activityIndicatorView, titleLabel)

        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        activityIndicatorView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.width.equalTo(73)
            make.centerX.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(activityIndicatorView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        addBlur()
        activityIndicatorView.startAnimating()
        titleLabel.text = "loading".localized
        titleLabel.font = AppFont.Style.font_600_22
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func startAnimating() {
        activityIndicatorView.startAnimating()
    }

    func stopAnimating() {
        activityIndicatorView.stopAnimating()
    }
}
