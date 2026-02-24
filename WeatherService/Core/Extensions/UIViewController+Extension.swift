//
//  UIViewController+Extension.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 23.02.2026.
//

import UIKit

extension UIViewController {

    var impactOccurred: Void { UIImpactFeedbackGenerator(style: .light).impactOccurred() }

    func setAlert(title: String, message: String? = nil, actions: [UIAlertAction]? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        defer { present(alertController, animated: true) }
        guard let actions else { return }
        actions.forEach { alertController.addAction($0) }
    }

    func showOKAlert(title: String, message: String? = nil) {
        let cancelAction = UIAlertAction(title: "OK", style: .cancel)
        setAlert(
            title: title,
            message: message,
            actions: [cancelAction]
        )
    }

    func goToSettings() {
        if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(settingsURL)
        }
    }
}
