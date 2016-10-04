//
//  WeekViewViewModel.swift
//  Cloudy
//
//  Created by Bart Jacobs on 04/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

struct WeekViewViewModel {

    // MARK: - Properties

    let weatherData: [WeatherDayData]

    // MARK: -

    private let dayFormatter = DateFormatter()
    private let dateFormatter = DateFormatter()

    // MARK: - Public Interface

    var numberOfSections: Int {
        return 1
    }

    var numberOfDays: Int {
        return weatherData.count
    }

    // MARK: -

    func day(for index: Int) -> String {
        // Fetch Weather Data
        let weatherDayData = weatherData[index]

        // Configure Date Formatter
        dayFormatter.dateFormat = "EEEE"

        return dayFormatter.string(from: weatherDayData.time)
    }

    func date(for index: Int) -> String {
        // Fetch Weather Data
        let weatherDayData = weatherData[index]

        // Configure Date Formatter
        dateFormatter.dateFormat = "MMMM d"

        return dateFormatter.string(from: weatherDayData.time)
    }

    func temperature(for index: Int) -> String {
        // Fetch Weather Data
        let weatherDayData = weatherData[index]

        let min = format(temperature: weatherDayData.temperatureMin)
        let max = format(temperature: weatherDayData.temperatureMax)

        return "\(min) - \(max)"
    }

    func windSpeed(for index: Int) -> String {
        // Fetch Weather Data
        let weatherDayData = weatherData[index]
        let windSpeed = weatherDayData.windSpeed

        switch UserDefaults.unitsNotation() {
        case .imperial:
            return String(format: "%.f MPH", windSpeed)
        case .metric:
            return String(format: "%.f KPH", windSpeed.toKPH())
        }
    }

    func image(for index: Int) -> UIImage? {
        // Fetch Weather Data
        let weatherDayData = weatherData[index]

        return UIImage.imageForIcon(withName: weatherDayData.icon)
    }

    // MARK: - Private Interface

    private func format(temperature: Double) -> String {
        switch UserDefaults.temperatureNotation() {
        case .fahrenheit:
            return String(format: "%.0f °F", temperature)
        case .celsius:
            return String(format: "%.0f °C", temperature.toCelcius())
        }
    }

}
