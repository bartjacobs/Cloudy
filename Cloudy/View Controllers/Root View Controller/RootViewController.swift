//
//  RootViewController.swift
//  Cloudy
//
//  Created by Bart Jacobs on 01/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    // MARK: - Constants

    private let segueDayView = "SegueDayView"
    private let segueWeekView = "SegueWeekView"

    // MARK: - Properties

    @IBOutlet private var dayViewController: DayViewController!
    @IBOutlet private var weekViewController: WeekViewController!

    // MARK: -

    private lazy var dataManager = {
        return DataManager(baseURL: API.AuthenticatedBaseURL)
    }()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        dataManager.weatherDataForLocation(latitude: Defaults.Latitude, longitude: Defaults.Longitude) { (response, error) in
            if let error = error {
                print(error)
            } else if let response = response {
                print(response)
            }
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }

        switch identifier {
        case segueDayView:
            if let dayViewController = segue.destination as? DayViewController {
                self.dayViewController = dayViewController
            } else {
                fatalError("Unexpected Destination View Controller")
            }
        case segueWeekView:
            if let weekViewController = segue.destination as? WeekViewController {
                self.weekViewController = weekViewController
            } else {
                fatalError("Unexpected Destination View Controller")
            }
        default: break
        }
    }

    // MARK: - View Methods

    private func setupView() {

    }

    private func updateView() {

    }

}
