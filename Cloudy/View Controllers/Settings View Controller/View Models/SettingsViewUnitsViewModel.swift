//
//  SettingsViewUnitsViewModel.swift
//  Cloudy
//
//  Created by Bart Jacobs on 05/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsViewUnitsViewModel: SettingsRepresentable {

    // MARK: - Properties

    let unitsNotation: UnitsNotation

    // MARK: - Public Interface

    var text: String {
        switch unitsNotation {
        case .imperial: return "Imperial"
        case .metric: return "Metric"
        }
    }

    var accessoryType: UITableViewCellAccessoryType {
        if UserDefaults.unitsNotation() == unitsNotation {
            return .checkmark
        } else {
            return .none
        }
    }
    
}
