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

    // MARK: - Public Interface

    var numberOfSections: Int {
        return 1
    }

    var numberOfDays: Int {
        return weatherData.count
    }

    // MARK: -

    func viewModel(for index: Int) -> WeatherDayRepresentable {
        return WeatherDayViewViewModel(weatherDayData: weatherData[index])
    }

}
