//
//  DayViewController.swift
//  Cloudy
//
//  Created by Bart Jacobs on 01/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

class DayViewController: WeatherViewController {

    // MARK: - Properties

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!

    // MARK: -

    var now: WeatherData? {
        didSet {
            updateView()
        }
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - View Methods

    private func setupView() {

    }

    private func updateView() {
        activityIndicatorView.stopAnimating()

        if let now = now {
            updateWeatherDataContainer(withWeatherData: now)

        } else {
            messageLabel.isHidden = false
            messageLabel.text = "Cloudy was unable to fetch weather data."

        }
    }

    // MARK: -

    private func updateWeatherDataContainer(withWeatherData weatherData: WeatherData) {
        weatherDataContainer.isHidden = false

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM d"
        dateLabel.text = dateFormatter.string(from: weatherData.time)

        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        timeLabel.text = timeFormatter.string(from: weatherData.time)

        descriptionLabel.text = weatherData.summary
        windSpeedLabel.text = String(format: "%.f MPH", weatherData.windSpeed)
        temperatureLabel.text = String(format: "%.1f °F", weatherData.temperature)
    }

}
