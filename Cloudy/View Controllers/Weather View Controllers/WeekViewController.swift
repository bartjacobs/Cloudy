//
//  WeekViewController.swift
//  Cloudy
//
//  Created by Bart Jacobs on 01/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

protocol WeekViewControllerDelegate {
    func controllerDidRefresh(controller: WeekViewController)
}

class WeekViewController: WeatherViewController {

    // MARK: - Properties

    @IBOutlet var tableView: UITableView!

    // MARK: -

    var delegate: WeekViewControllerDelegate?
    
    // MARK: -

    var week: [WeatherDayData]? {
        didSet {
            updateView()
        }
    }

    // MARK: -

    fileprivate lazy var dayFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter
    }()

    fileprivate lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d"
        return dateFormatter
    }()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - Public Interface

    override func reloadData() {
        updateView()
    }
    
    // MARK: - View Methods

    private func setupView() {
        setupTableView()
        setupRefreshControl()
    }

    private func updateView() {
        activityIndicatorView.stopAnimating()
        tableView.refreshControl?.endRefreshing()

        if let week = week {
            updateWeatherDataContainer(withWeatherData: week)

        } else {
            messageLabel.isHidden = false
            messageLabel.text = "Cloudy was unable to fetch weather data."
            
        }
    }

    // MARK: -

    private func setupTableView() {
        tableView.separatorInset = UIEdgeInsets.zero
    }

    private func setupRefreshControl() {
        // Initialize Refresh Control
        let refreshControl = UIRefreshControl()

        // Configure Refresh Control
        refreshControl.addTarget(self, action: #selector(WeekViewController.didRefresh(sender:)), for: .valueChanged)

        // Update Table View)
        tableView.refreshControl = refreshControl
    }

    // MARK: -

    private func updateWeatherDataContainer(withWeatherData weatherData: [WeatherDayData]) {
        weatherDataContainer.isHidden = false

        tableView.reloadData()
    }

    // MARK: - Actions

    func didRefresh(sender: UIRefreshControl) {
        delegate?.controllerDidRefresh(controller: self)
    }
    
}

extension WeekViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return week == nil ? 0 : 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let week = week else { return 0 }
        return week.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherDayTableViewCell.reuseIdentifier, for: indexPath) as? WeatherDayTableViewCell else { fatalError("Unexpected Table View Cell") }

        if let week = week {
            // Fetch Weather Data
            let weatherData = week[indexPath.row]

            var windSpeed = weatherData.windSpeed
            var temperatureMin = weatherData.temperatureMin
            var temperatureMax = weatherData.temperatureMax

            if UserDefaults.temperatureNotation() != .fahrenheit {
                temperatureMin = temperatureMin.toCelcius()
                temperatureMax = temperatureMax.toCelcius()
            }

            // Configure Cell
            cell.dayLabel.text = dayFormatter.string(from: weatherData.time)
            cell.dateLabel.text = dateFormatter.string(from: weatherData.time)

            let min = String(format: "%.0f°", temperatureMin)
            let max = String(format: "%.0f°", temperatureMax)

            cell.temperatureLabel.text = "\(min) - \(max)"

            if UserDefaults.unitsNotation() != .imperial {
                windSpeed = windSpeed.toKPH()
                cell.windSpeedLabel.text = String(format: "%.f KPH", windSpeed)
            } else {
                cell.windSpeedLabel.text = String(format: "%.f MPH", windSpeed)
            }

            cell.iconImageView.image = imageForIcon(withName: weatherData.icon)
        }

        return cell
    }

}
