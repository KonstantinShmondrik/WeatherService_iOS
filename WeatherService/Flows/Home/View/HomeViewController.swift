//
//  HomeViewController.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 23.02.2026.
//


import UIKit

class HomeViewController: UIViewController {

    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())

    var sections: [HomeSections] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
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
        view.addSubview(collectionView)
    }

    private func setLayoutConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
        }
    }

    private func stylize() {
        view.applyGradient(
            colors: [UIColor(hex: "#4FACFE"), UIColor(hex: "#00C6FB"), UIColor(hex: "#005BEA")],
            locations: view.gradientLocations(for: [UIColor(hex: "#4FACFE"), UIColor(hex: "#00C6FB"), UIColor(hex: "#005BEA")])
        )

        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.alwaysBounceVertical = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
    }

    private func setActions() {
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(CarnetViewCell.self)
        collectionView.register(HourlyViewCell.self)
        collectionView.register(DailyViewCell.self)
    }
}

extension HomeViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int { sections.count }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch sections[section].id {
        case .hourly(let items): return items.count
        case .daily(let items): return items.count
        default: return 1
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let section = sections[indexPath.section]
        switch section.id {
        case .carnet(let city, let current):
            let cell: CarnetViewCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.city = city
            cell.temperature = current.temperature
            cell.condition = current.conditionText
            cell.minMaxTemperature = current.minMaxTemperature
            return cell
        case .hourly(let items):
            let cell: HourlyViewCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.time = items[indexPath.item].time
            cell.temperature = items[indexPath.item].temperature
            if let url = items[indexPath.item].iconURL {
                cell.configure(with: url)
            }

            return cell

        case .daily(let items):
            let cell: DailyViewCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.title = items[indexPath.item].dayTitle
            if let url = items[indexPath.item].iconURL {
                cell.configure(with: url)
            }
            cell.configure(
                minTemperature: items[indexPath.item].minTemperature,
                maxTemperature: items[indexPath.item].maxTemperature
            )
            cell.isSeparatorHidden = indexPath.item == items.count - 1
            return cell
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {}

extension HomeViewController: HomeViewInput {

    func loading(_ isLoading: Bool) {
        isLoading ? Loader.shared.show() : Loader.shared.hide()
    }

    func showWeather(_ sections: [HomeSections], colors: [UIColor]) {
        self.sections = sections

        view.applyGradient(
            colors: colors,
            locations: view.gradientLocations(for: colors)
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
