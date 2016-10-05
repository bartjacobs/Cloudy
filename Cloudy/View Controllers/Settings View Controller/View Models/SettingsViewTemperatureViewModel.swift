//
//  SettingsViewTemperatureViewModel.swift
//  Cloudy
//
//  Created by Bart Jacobs on 05/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsViewTemperatureViewModel: SettingsRepresentable {

    // MARK: - Properties

    let temperatureNotation: TemperatureNotation

    // MARK: - Public Interface

    var text: String {
        switch temperatureNotation {
        case .fahrenheit: return "Fahrenheit"
        case .celsius: return "Celsius"
        }
    }

    var accessoryType: UITableViewCellAccessoryType {
        if UserDefaults.temperatureNotation() == temperatureNotation {
            return .checkmark
        } else {
            return .none
        }
    }
    
}
