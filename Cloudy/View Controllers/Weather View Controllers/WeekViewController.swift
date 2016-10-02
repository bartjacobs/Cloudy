//
//  WeekViewController.swift
//  Cloudy
//
//  Created by Bart Jacobs on 01/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

class WeekViewController: WeatherViewController {

    // MARK: - Properties

    @IBOutlet var tableView: UITableView!

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

    // MARK: - View Methods

    private func setupView() {
        setupTableView()
    }

    private func updateView() {
        activityIndicatorView.stopAnimating()

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

    // MARK: -

    private func updateWeatherDataContainer(withWeatherData weatherData: [WeatherDayData]) {
        weatherDataContainer.isHidden = false

        tableView.reloadData()
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

            // Configure Cell
            cell.dayLabel.text = dayFormatter.string(from: weatherData.time)
            cell.dateLabel.text = dateFormatter.string(from: weatherData.time)

            let min = String(format: "%.0f°", weatherData.temperatureMin)
            let max = String(format: "%.0f°", weatherData.temperatureMax)
            cell.temperatureLabel.text = "\(min) - \(max)"

            cell.windSpeedLabel.text = String(format: "%.f MPH", weatherData.windSpeed)

            cell.iconImageView.image = imageForIcon(withName: weatherData.icon)
        }

        return cell
    }

}
