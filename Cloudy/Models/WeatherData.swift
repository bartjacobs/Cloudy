//
//  WeatherData.swift
//  Cloudy
//
//  Created by Bart Jacobs on 01/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

struct WeatherData {

    let lat: Double
    let long: Double

    let dailyData: [WeatherDayData]

}

extension WeatherData: JSONDecodable {

    init(decoder: JSONDecoder) throws {
        self.lat = try decoder.decode(key: "latitude")
        self.long = try decoder.decode(key: "longitude")
        self.dailyData = try decoder.decode(key: "daily.data")
    }

}
