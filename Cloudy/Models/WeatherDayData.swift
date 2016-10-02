//
//  WeatherDayData.swift
//  Cloudy
//
//  Created by Bart Jacobs on 01/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import Foundation

struct WeatherDayData {

    let time: Date
    let icon: String
    let windSpeed: Double
    let temperatureMin: Double
    let temperatureMax: Double

}

extension WeatherDayData: JSONDecodable {

    init(decoder: JSONDecoder) throws {
        self.icon = try decoder.decode(key: "icon")
        self.windSpeed = try decoder.decode(key: "windSpeed")
        self.temperatureMin = try decoder.decode(key: "temperatureMin")
        self.temperatureMax = try decoder.decode(key: "temperatureMax")

        let time: Double = try decoder.decode(key: "time")
        self.time = Date(timeIntervalSince1970: time)
    }

}
