//
//  SettingsViewController.swift
//  Cloudy
//
//  Created by Bart Jacobs on 03/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet var tableView: UITableView!

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Settings"

        setupView()
    }

    // MARK: - View Methods

    private func setupView() {
        setupTableView()
    }

    private func updateView() {

    }

    // MARK: -

    private func setupTableView() {
        tableView.separatorInset = UIEdgeInsets.zero
    }

}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {

    private enum Section: Int {
        case time
        case units
        case temperature

        var numberOfRows: Int {
            return 2
        }

        static var count: Int {
            return (Section.temperature.rawValue + 1)
        }

    }

    // MARK: - Table View Data Source Methods

    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { fatalError("Unexpected Section") }
        return section.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else { fatalError("Unexpected Section") }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.reuseIdentifier, for: indexPath) as? SettingsTableViewCell else { fatalError("Unexpected Table View Cell") }

        switch section {
        case .time:
            cell.mainLabel.text = (indexPath.row == 0) ? "24 Hour" : "12 Hour"
        case .units:
            cell.mainLabel.text = (indexPath.row == 0) ? "Imperial" : "Metric"
        case .temperature:
            cell.mainLabel.text = (indexPath.row == 0) ? "Fahrenheit" : "Celcius"
        }

        return cell
    }

    // MARK: - Table View Delegate Methods

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
