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
    fileprivate let SegueSettingsView = "SegueSettingsView"

    // MARK: - Properties

    @IBOutlet fileprivate var dayViewController: DayViewController!
    @IBOutlet fileprivate var weekViewController: WeekViewController!

    // MARK: -

    fileprivate lazy var dataManager = {
        return DataManager(baseURL: API.AuthenticatedBaseURL)
    }()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        fetchWeatherData()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }

        switch identifier {
        case segueDayView:
            if let dayViewController = segue.destination as? DayViewController {
                self.dayViewController = dayViewController

                // Configure Day View Controller
                self.dayViewController.delegate = self
                
            } else {
                fatalError("Unexpected Destination View Controller")
            }
        case segueWeekView:
            if let weekViewController = segue.destination as? WeekViewController {
                self.weekViewController = weekViewController

                // Configure Day View Controller
                self.weekViewController.delegate = self

            } else {
                fatalError("Unexpected Destination View Controller")
            }
        case SegueSettingsView:
            if let navigationController = segue.destination as? UINavigationController,
               let settingsViewController = navigationController.topViewController as? SettingsViewController {
                settingsViewController.delegate = self
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

    // MARK: - Actions

    @IBAction func unwindToRootViewController(segue: UIStoryboardSegue) {
        
    }

    // MARK: - Helper Methods

    fileprivate func fetchWeatherData() {
        dataManager.weatherDataForLocation(latitude: Defaults.Latitude, longitude: Defaults.Longitude) { (response, error) in
            if let error = error {
                print(error)
            } else if let response = response {
                // Configure Day View Controller
                self.dayViewController.now = response

                // Configure Week View Controller
                self.weekViewController.week = response.dailyData
            }
        }
    }

}

extension RootViewController: DayViewControllerDelegate {

    func controllerDidTapSettingsButton(controller: DayViewController) {
        performSegue(withIdentifier: SegueSettingsView, sender: self)
    }

}

extension RootViewController: WeekViewControllerDelegate {

    func controllerDidRefresh(controller: WeekViewController) {
        fetchWeatherData()
    }

}

extension RootViewController: SettingsViewControllerDelegate {

    func controllerDidChangeTimeNotation(controller: SettingsViewController) {
        dayViewController.reloadData()
        weekViewController.reloadData()
    }

    func controllerDidChangeUnitsNotation(controller: SettingsViewController) {
        dayViewController.reloadData()
        weekViewController.reloadData()
    }

    func controllerDidChangeTemperatureNotation(controller: SettingsViewController) {
        dayViewController.reloadData()
        weekViewController.reloadData()
    }

}
