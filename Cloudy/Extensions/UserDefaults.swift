//
//  UserDefaults.swift
//  Cloudy
//
//  Created by Bart Jacobs on 03/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import Foundation

enum TimeNotation: Int {
    case twelveHour
    case twentyFourHour

    var timeFormat: String {
        switch self {
        case .twelveHour: return "hh:mm a"
        case .twentyFourHour: return "HH:mm"
        }
    }
}

enum UnitsNotation: Int {
    case imperial
    case metric
}

enum TemperatureNotation: Int {
    case fahrenheit
    case celsius
}

struct UserDefaultsKeys {
    static let timeNotation = "timeNotation"
    static let unitsNotation = "unitsNotation"
    static let temperatureNotation = "temperatureNotation"
}

extension UserDefaults {

    // MARK: - Timer Notation

    static func timeNotation() -> TimeNotation {
        let storedValue = UserDefaults.standard.integer(forKey: UserDefaultsKeys.timeNotation)
        return TimeNotation(rawValue: storedValue) ?? TimeNotation.twelveHour
    }

    static func setTimeNotation(timeNotation: TimeNotation) {
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
    }

    // MARK: - Units Notation
    
    static func unitsNotation() -> UnitsNotation {
        let storedValue = UserDefaults.standard.integer(forKey: UserDefaultsKeys.unitsNotation)
        return UnitsNotation(rawValue: storedValue) ?? UnitsNotation.imperial
    }

    static func setUnitsNotation(unitsNotation: UnitsNotation) {
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
    }

    // MARK: - Temperature Notation
    
    static func temperatureNotation() -> TemperatureNotation {
        let storedValue = UserDefaults.standard.integer(forKey: UserDefaultsKeys.temperatureNotation)
        return TemperatureNotation(rawValue: storedValue) ?? TemperatureNotation.fahrenheit
    }

    static func setTemperatureNotation(temperatureNotation: TemperatureNotation) {
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
    }

}
