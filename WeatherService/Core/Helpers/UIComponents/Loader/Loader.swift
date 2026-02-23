//
//  Loader.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 23.02.2026.
//


import UIKit

final class Loader {

    static let shared = Loader()
    private var loadingView = LoadingView()

    private init() {}

//    func show() {
//        guard let windowScene = UIApplication.shared.connectedScenes
//            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
//              let window = windowScene.windows.first else {
//            return
//        }
//
//        loadingView.frame = window.bounds
//        window.addSubview(loadingView)
//        loadingView.startAnimating()
//    }
//
//    func hide() {
//        loadingView.removeFromSuperview()
//    }

    func show() {
        guard let windowScene = UIApplication.shared.connectedScenes
                .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
              let window = windowScene.windows.first else { return }

        loadingView.frame = window.bounds
        loadingView.alpha = 0
        window.addSubview(loadingView)

        UIView.animate(withDuration: 0.25) {
            self.loadingView.alpha = 1
        }

        loadingView.startAnimating()
    }

    func hide() {
        UIView.animate(withDuration: 0.25, animations: {
            self.loadingView.alpha = 0
        }) { _ in
            self.loadingView.removeFromSuperview()
        }
    }
}
