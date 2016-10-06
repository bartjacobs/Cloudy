//
//  SettingsViewUnitsViewModelTests.swift
//  Cloudy
//
//  Created by Bart Jacobs on 06/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsViewUnitsViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()

        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
    }

    // MARK: - Tests for Text

    func testText_Imperial() {
        let viewModel = SettingsViewUnitsViewModel(unitsNotation: .imperial)

        XCTAssertEqual(viewModel.text, "Imperial")
    }

    func testText_Metric() {
        let viewModel = SettingsViewUnitsViewModel(unitsNotation: .metric)

        XCTAssertEqual(viewModel.text, "Metric")
    }

    // MARK: - Tests for Accessory Type

    func testAccessoryType_Imperial_Imperial() {
        let unitsNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)

        let viewModel = SettingsViewUnitsViewModel(unitsNotation: .imperial)

        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
    }


    func testAccessoryType_Imperial_Metric() {
        let unitsNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)

        let viewModel = SettingsViewUnitsViewModel(unitsNotation: .metric)

        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
    }

    func testAccessoryType_Metric_Imperial() {
        let unitsNotation: UnitsNotation = .metric
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)

        let viewModel = SettingsViewUnitsViewModel(unitsNotation: .imperial)

        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
    }


    func testAccessoryType_Metric_Metric() {
        let unitsNotation: UnitsNotation = .metric
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)

        let viewModel = SettingsViewUnitsViewModel(unitsNotation: .metric)

        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
    }

}
