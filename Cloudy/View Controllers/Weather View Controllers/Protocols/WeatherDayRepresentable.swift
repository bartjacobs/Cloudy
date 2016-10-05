//
//  WeatherDayRepresentable.swift
//  Cloudy
//
//  Created by Bart Jacobs on 05/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

protocol WeatherDayRepresentable {

    var day: String { get }
    var date: String { get }
    var image: UIImage? { get }
    var windSpeed: String { get }
    var temperature: String { get }

}
