//
//  SettingsRepresentable.swift
//  Cloudy
//
//  Created by Bart Jacobs on 05/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

protocol SettingsRepresentable {

    var text: String { get }
    var accessoryType: UITableViewCellAccessoryType { get }

}
