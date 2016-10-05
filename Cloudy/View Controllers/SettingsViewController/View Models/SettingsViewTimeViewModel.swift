//
//  SettingsViewTimeViewModel.swift
//  Cloudy
//
//  Created by Bart Jacobs on 05/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsViewTimeViewModel {

    // MARK: - Properties

    let timeNotation: TimeNotation

    // MARK: - Public Interface

    var text: String {
        switch timeNotation {
        case .twelveHour: return "12 Hour"
        case .twentyFourHour: return "24 Hour"
        }
    }

    var accessoryType: UITableViewCellAccessoryType {
        if UserDefaults.timeNotation() == timeNotation {
            return .checkmark
        } else {
            return .none
        }
    }

}
