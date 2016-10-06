//
//  DayViewViewModelTests.swift
//  Cloudy
//
//  Created by Bart Jacobs on 06/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class DayViewViewModelTests: XCTestCase {

    var viewModel: DayViewViewModel!

    override func setUp() {
        super.setUp()

        // Load Stub
        let data = loadDataFromBundle()
        let weatherData: WeatherData = try! JSONDecoder.decode(data: data)

        // Initialize View Model
        viewModel = DayViewViewModel(weatherData: weatherData)
    }
    
    override func tearDown() {
        super.tearDown()

        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.timeNotation)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.temperatureNotation)
    }

    // MARK: - Tests for Date

    func testDate() {
        XCTAssertEqual(viewModel.date, "Thu, October 6")
    }

    // MARK: - Tests for Time

    func testTime_TwelveHour() {
        let timeNotation: TimeNotation = .twelveHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)

        XCTAssertEqual(viewModel.time, "11:32 AM")
    }

    func testTime_TwentyFourHour() {
        let timeNotation: TimeNotation = .twentyFourHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)

        XCTAssertEqual(viewModel.time, "11:32")
    }

    // MARK: - Tests for Summary

    func testSummary() {
        XCTAssertEqual(viewModel.summary, "Partly Cloudy")
    }

    // MARK: - Tests for Temperature

    func testTemperature_Fahrenheit() {
        let temperatureNotation: TemperatureNotation = .fahrenheit
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)

        XCTAssertEqual(viewModel.temperature, "47.5 °F")
    }

    func testTemperature_Celsius() {
        let temperatureNotation: TemperatureNotation = .celsius
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)

        XCTAssertEqual(viewModel.temperature, "8.6 °C")
    }

    // MARK: - Tests for Wind Speed

    func testWindSpeed_Imperial() {
        let unitsNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)

        XCTAssertEqual(viewModel.windSpeed, "9 MPH")
    }

    func testWindSpeed_Metric() {
        let unitsNotation: UnitsNotation = .metric
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)

        XCTAssertEqual(viewModel.windSpeed, "15 KPH")
    }

    // MARK: - Tests for Image

    func testImage() {
        let viewModelImage = viewModel.image
        let imageDataViewModel = UIImagePNGRepresentation(viewModelImage!)!
        let imageDataReference = UIImagePNGRepresentation(UIImage(named: "cloudy")!)!

        XCTAssertNotNil(viewModelImage)
        XCTAssertEqual(viewModelImage!.size.width, 236.0)
        XCTAssertEqual(viewModelImage!.size.height, 172.0)
        XCTAssertEqual(imageDataViewModel, imageDataReference)
    }

    // MARK: - Helper Methods

    private func loadDataFromBundle() -> Data {
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: "forecast", withExtension: "json")

        return try! Data(contentsOf: url!)
    }

}
