//
//  HomeViewController.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 23.02.2026.
//


import UIKit

class HomeViewController: UIViewController {

    private var items: WeatherScreenModel? = nil {
        didSet {
            Logger.log("\(items)", level: .debug)
        }
    }

    let presenter: HomeViewOutput

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        Loader.shared.show()
        presenter.getWeather()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        setLayoutConstraints()
        stylize()
        setActions()
    }

    init(presenter: HomeViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {

    }

    private func setLayoutConstraints() {

    }

    private func stylize() {
        view.applyGradient(
            colors: [UIColor(hex: "#4FACFE"), UIColor(hex: "#00C6FB"), UIColor(hex: "#005BEA")],
            locations: view.gradientLocations(for: [UIColor(hex: "#4FACFE"), UIColor(hex: "#00C6FB"), UIColor(hex: "#005BEA")])
        )

    }

    private func setActions() {

    }

}

extension HomeViewController: HomeViewInput {

    func loading(_ isLoading: Bool) {
        isLoading ? Loader.shared.show() : Loader.shared.hide()
    }

    func showWeather(_ model: WeatherScreenModel) {
        items = model

        view.applyGradient(
            colors: model.current.colors,
            locations: view.gradientLocations(for: model.current.colors)
        )
    }

    func showErrorAlert(title: String, text: String) {
        let tryAgainAction = UIAlertAction(title: "Try again", style: .default) { [weak self] _ in
            self?.presenter.getWeather()
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        DispatchQueue.main.async { [weak self] in
            self?.setAlert(title: title, message: text, actions: [tryAgainAction, cancelAction])
        }
    }

    func showSettingsAlert(title: String, text: String) {
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { [weak self] _ in
            self?.goToSettings()
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        DispatchQueue.main.async { [weak self] in
            self?.setAlert(title: title, message: text, actions: [settingsAction, cancelAction])
        }
    }
}
