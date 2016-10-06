//
//  WeekViewViewModelTests.swift
//  Cloudy
//
//  Created by Bart Jacobs on 06/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class WeekViewViewModelTests: XCTestCase {

    var viewModel: WeekViewViewModel!

    override func setUp() {
        super.setUp()

        // Load Stub
        let data = loadStubFromBundle(withName: "forecast", extension: "json")
        let weatherData: WeatherData = try! JSONDecoder.decode(data: data)

        // Initialize View Model
        viewModel = WeekViewViewModel(weatherData: weatherData.dailyData)
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: - Tests for Number of Sections

    func testNumberOfSections() {
        XCTAssertEqual(viewModel.numberOfSections, 1)
    }

    // MARK: - Tests for Number of Days

    func testNumberOfDays() {
        XCTAssertEqual(viewModel.numberOfDays, 8)
    }

    // MARK: - Tests for View Model for Index

    func testViewModelForIndex() {
        let weatherDayViewViewModel = viewModel.viewModel(for: 5)

        XCTAssertEqual(weatherDayViewViewModel.day, "Tuesday")
        XCTAssertEqual(weatherDayViewViewModel.date, "October 11")
    }
    
}
