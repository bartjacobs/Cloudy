//
//  SettingsViewTimeViewModelTests.swift
//  Cloudy
//
//  Created by Bart Jacobs on 06/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsViewTimeViewModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()

        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.timeNotation)
    }

    // MARK: - Tests for Text

    func testText_TwelveHour() {
        let viewModel = SettingsViewTimeViewModel(timeNotation: .twelveHour)

        XCTAssertEqual(viewModel.text, "12 Hour")
    }

    func testText_TwentyFourHour() {
        let viewModel = SettingsViewTimeViewModel(timeNotation: .twentyFourHour)

        XCTAssertEqual(viewModel.text, "24 Hour")
    }

    // MARK: - Tests for Accessory Type

    func testAccessoryType_TwelveHour_TwelveHour() {
        let timeNotation: TimeNotation = .twelveHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)

        let viewModel = SettingsViewTimeViewModel(timeNotation: .twelveHour)

        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
    }

    func testAccessoryType_TwelveHour_TwentyFourHour() {
        let timeNotation: TimeNotation = .twelveHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)

        let viewModel = SettingsViewTimeViewModel(timeNotation: .twentyFourHour)

        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
    }

    func testAccessoryType_TwentyFourHour_TwelveHour() {
        let timeNotation: TimeNotation = .twentyFourHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)

        let viewModel = SettingsViewTimeViewModel(timeNotation: .twelveHour)

        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
    }

    func testAccessoryType_TwentyFourHour_TwentyFourHour() {
        let timeNotation: TimeNotation = .twentyFourHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)

        let viewModel = SettingsViewTimeViewModel(timeNotation: .twentyFourHour)
        
        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
    }
    
}
