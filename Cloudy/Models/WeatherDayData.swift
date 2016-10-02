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
    let windSpeed: Double
    let precipitation: Double
    let temperatureMin: Double
    let temperatureMax: Double

}

extension WeatherDayData: JSONDecodable {

    init(decoder: JSONDecoder) throws {
        self.windSpeed = try decoder.decode(key: "windSpeed")
        self.precipitation = try decoder.decode(key: "precipIntensity")
        self.temperatureMin = try decoder.decode(key: "temperatureMin")
        self.temperatureMax = try decoder.decode(key: "temperatureMax")

        let time: Double = try decoder.decode(key: "time")
        self.time = Date(timeIntervalSince1970: time)
    }

}
